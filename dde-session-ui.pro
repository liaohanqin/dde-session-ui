TEMPLATE = subdirs
SUBDIRS += dde-shutdown \
           dde-lock \
           lightdm-deepin-greeter \
           dde-lockservice \
           dde-switchtogreeter \
           dde-lowpower \
           dde-osd \
           dde-zone \
           dde-wallpaper-chooser

include(common.pri)
contains(DEFINES, ARCH_MIPSEL) {
    SUBDIRS += session-ui-guardien
}

# Automating generation .qm files from .ts files
system($$PWD/translate_generation.sh)

qm_files.path = /usr/share/dde-session-ui/translations/
qm_files.files = translations/*.qm

INSTALLS += qm_files
