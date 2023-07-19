set( APPLICATION_NAME       "Next.flydoc" )
set( APPLICATION_SHORTNAME  "Nextflydoc" )
set( APPLICATION_EXECUTABLE "nextflydoc" )
set( APPLICATION_CONFIG_NAME "${APPLICATION_EXECUTABLE}" )
set( APPLICATION_DOMAIN     "next.flydoc.cloud" )
set( APPLICATION_VENDOR     "Prospettive Hi-Tech" )
set( APPLICATION_UPDATE_URL "https://updates.flydoc.cloud/client/" CACHE STRING "URL for updater" )
set( APPLICATION_HELP_URL   "https://flydoc.cloud/" CACHE STRING "URL for the help menu" )

if(APPLE AND APPLICATION_NAME STREQUAL "Nextcloud" AND EXISTS "${CMAKE_SOURCE_DIR}/theme/colored/Nextcloud-macOS-icon.svg")
    set( APPLICATION_ICON_NAME "Nextcloud-macOS" )
    message("Using macOS-specific application icon: ${APPLICATION_ICON_NAME}")
else()
    set( APPLICATION_ICON_NAME "${APPLICATION_SHORTNAME}" )
endif()

set( APPLICATION_ICON_SET   "SVG" )
set( APPLICATION_SERVER_URL "https://next.flydoc.cloud" CACHE STRING "URL for the server to use. If entered, the UI field will be pre-filled with it" )
set( APPLICATION_SERVER_URL_ENFORCE ON ) # If set and APPLICATION_SERVER_URL is defined, the server can only connect to the pre-defined URL
set( APPLICATION_REV_DOMAIN "com.nextflydoccloud.desktopclient" )
set( APPLICATION_VIRTUALFILE_SUFFIX "nextflydoc" CACHE STRING "Virtual file suffix (not including the .)")
set( APPLICATION_OCSP_STAPLING_ENABLED OFF )
set( APPLICATION_FORBID_BAD_SSL OFF )

set( LINUX_PACKAGE_SHORTNAME "nextcloud" )
set( LINUX_APPLICATION_ID "${APPLICATION_REV_DOMAIN}.${LINUX_PACKAGE_SHORTNAME}")

set( THEME_CLASS            "NextcloudTheme" )
set( WIN_SETUP_BITMAP_PATH  "${CMAKE_SOURCE_DIR}/admin/win/nsi" )

set( MAC_INSTALLER_BACKGROUND_FILE "${CMAKE_SOURCE_DIR}/admin/osx/installer-background.png" CACHE STRING "The MacOSX installer background image")

# set( THEME_INCLUDE          "${OEM_THEME_DIR}/mytheme.h" )
# set( APPLICATION_LICENSE    "${OEM_THEME_DIR}/license.txt )

option( WITH_CRASHREPORTER "Build crashreporter" OFF )
#set( CRASHREPORTER_SUBMIT_URL "https://crash-reports.owncloud.com/submit" CACHE STRING "URL for crash reporter" )
#set( CRASHREPORTER_ICON ":/owncloud-icon.png" )

## Updater options
option( BUILD_UPDATER "Build updater" ON )

option( WITH_PROVIDERS "Build with providers list" OFF )

option( ENFORCE_VIRTUAL_FILES_SYNC_FOLDER "Enforce use of virtual files sync folder when available" OFF )

option(ENFORCE_SINGLE_ACCOUNT "Enforce use of a single account in desktop client" OFF)

option( DO_NOT_USE_PROXY "Do not use system wide proxy, instead always do a direct connection to server" OFF )

## Theming options
set(NEXTCLOUD_BACKGROUND_COLOR "#db2828" CACHE STRING "Default Nextcloud background color")
set( APPLICATION_WIZARD_HEADER_BACKGROUND_COLOR ${NEXTCLOUD_BACKGROUND_COLOR} CACHE STRING "Hex color of the wizard header background")
set( APPLICATION_WIZARD_HEADER_TITLE_COLOR "#ffffff" CACHE STRING "Hex color of the text in the wizard header")
option( APPLICATION_WIZARD_USE_CUSTOM_LOGO "Use the logo from ':/client/theme/colored/wizard_logo.(png|svg)' else the default application icon is used" ON )


#
## Windows Shell Extensions & MSI - IMPORTANT: Generate new GUIDs for custom builds with "guidgen" or "uuidgen"
#
if(WIN32)
    # Context Menu
    set( WIN_SHELLEXT_CONTEXT_MENU_GUID      "{922e100e-0492-4521-8e7e-f4ca2de4a226}" )

    # Overlays
    set( WIN_SHELLEXT_OVERLAY_GUID_ERROR     "{7b79b903-e941-4c77-a921-2f15b64aa3c5}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK        "{ad1fa0a7-63e4-472a-bc76-430dd6d44c76}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_OK_SHARED "{46912b77-76bf-41f8-83c7-850f80c4d5a3}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_SYNC      "{68d90dbe-b9ce-49fc-ac06-13d3114b9cfe}" )
    set( WIN_SHELLEXT_OVERLAY_GUID_WARNING   "{8f66c36e-6e89-49e2-941b-4e61ff0180fa}" )

    # MSI Upgrade Code (without brackets)
    set( WIN_MSI_UPGRADE_CODE                "07c24666-382e-4575-b1e4-f9da7284640c" )

    # Windows build options
    option( BUILD_WIN_MSI "Build MSI scripts and helper DLL" OFF )
    option( BUILD_WIN_TOOLS "Build Win32 migration tools" OFF )
endif()

if (APPLE)
    set( BUILD_FILE_PROVIDER_MODULE OFF )
endif()
