# ------------------------------
# DOCUMENTATIN APP FOR STARTER 2
# ------------------------------
#
# Reads the documentation from a remote server and from the local disc.
#
# Directory structure inside the resources/docs folder:
#
#     my.generic.documentation
#      ├── 0.1
#      ├── v0.2
#      └── 0.3
#
# JSON structure for the remote documentation:
#
#     {
#         items: [
#             {
#                 name: "remote.documentation",
#                 version: "0.2",
#                 state: "released",
#                 url: "http://docs.dev/remote.documentation/v0.2/index.html",
#                 zip: "http://docs.dev/remote.documentation/v0.2.zip",
#                 icon: "http://docs.dev/remote.documentation/icon.png"
#             },{
#                 name: "remote.documentation",
#                 version: "0.3",
#                 state: "released",
#                 url: "http://docs.dev/remote.documentation/0.3/index.html",
#                 zip: "http://docs.dev/remote.documentation/0.3.zip",
#                 icon: "http://docs.dev/remote.documentation/icon.png"
#             }
#         ]
#     }
#
# Configuration Help:
#
#    "settings": {
#        "docs_path": Path to the local documentation folder,
#        "docs_url":  Absolute URL to the docs server,
#        "docs_icon": Absolute URL to the default image,
#        "docs_user": Username of the Plone user,
#        "docs_password": Password of the Plone user
#    }


# Model
# ----------------------------------------------------------------------------
Ext.define  "DocApp.model.Doc",
    extend: "Ext.data.Model"

    fields: [
        name: "name"
        type: "string"
    ,
        name: "url"
        type: "string"
    ,
        name: "zip"
        type: "string"
    ,
        name: "version"
        type: "string"
    ,
        name: "state"
        type: "string"
    ,
        name: "icon"
        type: "string"
    ,
        name: "local"
        type: "string"
        default: no
    ]

# View
# ----------------------------------------------------------------------------
Ext.define  "DocApp.view.Docs",
    extend: "Ext.panel.Panel"
    title: "All Documentations"

    initComponent: ->
        @tbar =
            items: [
                xtype: "radiogroup"
                fieldLabel: "Filter by State"
                listeners:
                    change: @updateFilter
                    scope:  @
                defaults:
                    boxLabelAlign: "before"
                    margin: "0 10 0 0"
                items: [
                    boxLabel:      "Released"
                    name:          "state"
                    inputValue:    "released"
                    checked:       yes
                ,
                    boxLabel:      "Latest"
                    name:          "state"
                    inputValue:    "latest"
                ,
                    boxLabel:      "Local"
                    name:          "state"
                    inputValue:    "local"
                ,
                    boxLabel:      "All"
                    name:          "state"
                    inputValue:    "all"
                ]
            ,
                xtype: "tbfill"
            ,
                xtype: "label"
            ,
                xtype: "button"
                text: "Reload"
                listeners:
                  scope: @store
                  click: @store.reload
            ]

        @items =
            xtype: "dataview"
            store: @store
            tpl: [
              '<tpl for=".">'
                '<div style="cursor:pointer;padding:1em;text-align:center;'
                            'text-overflow:ellipsis;float:left;overflow:hidden;'
                            'width:150px;height:150px;"'
                      'data-qtip="{name} - {version}" class="thumb-wrap">'
                  '<div class="thumb"><img width="64" height="64" src="{icon}"'
                    '<tpl if="!local">style="opacity: 0.4;filter: alpha(opacity=40);"</tpl>'
                    '></div>'
                  '<strong>{name}</strong><small> ({version})</small>'
                '</div>'
              '</tpl>'
              '<div class="x-clear"></div>'
            ]
            emptyText: 'No Documentation available'
            trackOver: yes
            itemSelector: 'div.thumb-wrap'

        @callParent arguments
        @store.on "load", @updateFilter, @

    getCurrentFilter: ->
        @query('radiofield[name=state]')[0].getGroupValue()

    updateFilter: ->
        @store.clearFilter()
        filter = @getCurrentFilter()
        if filter is "all" then return
        if filter is "latest"
          @store.filterBy (item) =>
            group = @store.getGroups(item.get("name")).children

            max = item
            for record in group
              if @store.compareRecords(record, max) > 0
                max = record
            return max is item

          return
        @store.filterBy (item) ->
            if item.get("state") == filter
                return yes
            return no


# Store
# ----------------------------------------------------------------------------
Ext.define  "DocApp.store.Docs",
    extend: "Ext.data.Store"
    model:  "DocApp.model.Doc"
    autoLoad: yes
    sorters: [
      property: "version"
      sorterFn: @compareRecords
    ]
    groupers: [
      property: "name"
    ]

    constructor: (config) ->

        config.proxy =
            type: "ajax"
            url:  config.url
            headers:
              Authorization: config.auth
            startParam: undefined
            idParam: undefined
            reader:
                type: "json"
                root: "items"
        @callParent arguments

    compareRecords: (r1, r2) ->
      return 0 if r1 is r2
      v1 = r1.get("version").replace("v", "").split('.')
      v2 = r2.get("version").replace("v", "").split('.')
      if v1.length >= v2.length then lim = v1.length
      else
        lim = v2.length
      for i in [0..lim]
        if i >= v1.length
          result = -1
          break;
        else if i >= v2.length
          result = 1
          break;
        result = parseInt(v1[i])-parseInt(v2[i])
        break if result isnt 0
      return result

# Controller
# ----------------------------------------------------------------------------
fs = require "fs"
http = require "http"
mkdirp = require "mkdirp"

Ext.define "DocApp",
    extend: "Ext.Base"

    launch: ->
        # Triggered by the App framework
        console.info "*** DocApp::launch"

        # get the tab panel
        @panel = @getTabpanel()
        # show the loading spinner
        @panel.setLoading yes

        # load the remote doc store
        @store = Ext.create "DocApp.store.Docs",
            url: @getRemoteDocsURL()
            auth: @getAuthHeader()
        @store.on "load", @onStoreLoaded, @

        # create the documentation data view
        @view = Ext.create "DocApp.view.Docs",
            store: @store
        @panel.add @view
        @panel.setActiveTab @view

        # add click handler inside the dataview
        @dataview = @view.down "dataview"
        @dataview.on "itemclick",       @onItemClick, @
        @dataview.on "itemcontextmenu", @onItemContextMenu, @

    # Open Documentation Tab
    # ------------------------------------------------------------------------
    open: (record) ->
        ### Open the documentation
        ###
        iframe = Ext.widget "uxiframe",
            src: record.get "url"
            title: "#{record.get 'name'} - #{record.get 'version'}"
            closable: yes

        @panel.add iframe
        @panel.setActiveTab iframe

    # Local Documentation Handler
    # ------------------------------------------------------------------------
    getLocalDocsPath: ->
        return @app_model.settingsStore.getById("docs_path").get "value"

    getDefaultDocsIcon: ->
        return @app_model.settingsStore.getById("docs_icon").get "value"

    getDefaultDocsRemoteIcon: ->
        return @app_model.settingsStore.getById("docs_remote_icon").get "value"

    getRemoteDocsURL: ->
        return @app_model.settingsStore.getById("docs_url").get "value"

    getDocIcon: (filepath) ->
        icon = @joinPaths filepath, "icon.png"
        if fs.existsSync icon
            return icon
        return @getDefaultDocsIcon()

    makeLocalDocRecordsFor: (filename, filepath) ->
        out = []
        versions = fs.readdirSync filepath
        for version in versions
          versionpath = @joinPaths filepath, version
          if fs.lstatSync(versionpath).isDirectory()
            record =
                name:    filename
                url:     @joinPaths versionpath, "index.html"
                version: version
                state:   "local"
                icon:    @getDocIcon filepath
                local:   yes
            out.push record
        return out

    addLocalDocs: ->
        basepath  =  @getLocalDocsPath()
        filenames = fs.readdirSync basepath

        for filename in filenames
            filepath = @joinPaths basepath, filename
            if fs.lstatSync(filepath).isDirectory()
                records = @makeLocalDocRecordsFor filename, filepath
                @removeRemotesOf records
                @store.add records

    getAuthHeader: ->
      usr = @app_model.settingsStore.getById("docs_user").get "value"
      pwd = @app_model.settingsStore.getById("docs_password").get "value"
      return "Basic " + btoa(usr + ":" + pwd)

    getUser: (cb, error) ->
      Ext.Ajax.request
        url: @joinPaths @getRemoteDocsURL(), "login"
        headers:
          Authorization: @getAuthHeader()
        success: (response, opts) ->
          if response.status isnt 200
            console.error "Got status "+response.status+" response"
            error()
            return
          obj = Ext.decode response.responseText
          result = null
          if obj.logged_in then result = obj.name
          cb(result)
        failure: error

    downloadIcon: (record) ->
        url = record.get "icon"
        if url is @joinPaths(@getDefaultDocsRemoteIcon(), "icon.png") then return
        dir = @joinPaths @getLocalDocsPath(), record.get("name"), "icon.png"

        file = fs.createWriteStream dir

        http.get url, (response) ->
          response.on("data", (data) ->
            console.log "Downloading icon from " + url
            file.write(data)
          ).on "end", ->
            file.end()
            console.log "Icon downloaded to " + dir
        .on "error", (err) =>
          console.error "Download failed: " + err.message
          fs.unlinkSync dir
          @store.reload()
        file.on "finish", =>
          @store.reload()

    download: (record) ->
        AdmZip = require "adm-zip"

        fileurl = record.get("zip")
        basedir = @joinPaths @getLocalDocsPath(), record.get("name")
        dir = @joinPaths basedir, record.get("version")
        zipdir = dir + ".zip"

        @panel.setLoading true
        mkdirp dir, (err) =>
          if err
            console.error err
            return

          console.log "Created doc directory in " + dir
          file = fs.createWriteStream zipdir

          req = http.get fileurl, (response) ->
            response.on("data", (data) ->
              console.log "Downloading zip file from " + fileurl
              file.write(data)
            ).on "end", ->
              file.end()
              console.log "Data downloaded to " + zipdir
          .on "error", (err) =>
            console.error "Download failed: " + err.message
            @rmdir dir
            @store.reload()
            Ext.Msg.show
              title: "Error"
              msg: "The Download Failed"
              buttons: Ext.Msg.OK
              icon: Ext.Msg.ERROR

          file.on "finish", =>
            try
              console.log "Unpacking files to " + dir
              zip = new AdmZip zipdir
              zip.extractAllTo dir, yes
              @downloadIcon(record)
            catch err
              console.error err
              @rmdir dir
              @store.reload()
              Ext.Msg.show
                title: "Error"
                msg: "Unpacking ZIP Failed"
                buttons: Ext.Msg.OK
                icon: Ext.Msg.ERROR


    removeRemotesOf: (records) ->
      rem = []
      @store.each (record) ->
        for local in records
          if record.get("local") isnt "true" and record.get("name") is local.name and record.get("version") is local.version
            rem.push record
            console.log "Hide remote Doc of " + record.get "name"
      , this

      @store.remove(rem)

    # Helper
    # ------------------------------------------------------------------------
    joinPaths: ->
        paths = Ext.toArray arguments
        return paths.join "/"

    getTabpanel: ->
        @app_view.queryById "docpanel"

    rmdir: (dir) ->
      path = require "path"

      rm = (dir) ->
        list = fs.readdirSync dir
        for item in list
          filename = path.join dir, item
          stat = fs.statSync filename
          if filename in [".", ".."]
            # Skip
          else if stat.isDirectory()
            # Remove directory recursively
            rm filename
          else
            # Remove file
            fs.unlinkSync filename
        fs.rmdirSync dir
      rm dir

    # Callbacks
    # ------------------------------------------------------------------------
    onStoreLoaded: (store, records, success) ->
        ### Remote located documentation
        #
        # 1. We need to merge the remove data with the local docs folder
        # 2. We need a way to sort the docs by remote/local
        # 3. We need to download the docs on the fly
        ###
        console.debug "°°° DocApp::onStoreLoaded"

        @getUser (usr) =>
          if usr then @view.down("label").setText "Logged in as " + usr
        , =>
          @view.down("label").setText "Offline"

        store.each (record) ->
            if not record.get "icon"
                record.set "icon", @getDefaultDocsRemoteIcon()
        , this

        # add local documentations
        @addLocalDocs()
        # hide the loading spinner
        @panel.setLoading no

    onItemClick: (view, record, item, index, e, eOpts) ->
        ### Show documentation in a new tab
        #
        # 1. We need to check if it is a local or remote doc
        # 2. we need to download if needed
        ###
        console.debug "°°° DocApp::onItemClick"
        if not record.get "local"
          Ext.Msg.show
            title: "Download Documentation?"
            msg: "The documentation is not locally available. Would you like to download it?"
            buttons: Ext.Msg.YESNO
            icon: Ext.Msg.QUESTION
            fn: (button) =>
              if button is "yes" then @download record
              else
                @open record
          return
        @open record

    onItemContextMenu: (view, record, item, index, e, eOpts) ->
        if record.get "local"
            console.debug "Documentation already locally available"
            Ext.Msg.alert "Already Downloaded", "The documentation is already locally available."
            return
        Ext.Msg.show
          title: "Download Documentation"
          msg: "Start Download of Documentation"
          buttons: Ext.Msg.OKCANCEL
          fn: (button) =>
            if button is "ok" then @download record

# Register Class in the Starter Framework
# ----------------------------------------------------------------------------
window.AppDelegate.registerClass "doc_app", DocApp

# vim: set ft=coffee ts=4 sw=4 expandtab :