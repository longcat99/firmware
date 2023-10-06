################################################################################
#
# venc-openipc
#
################################################################################

VENC_OPENIPC_LICENSE = MIT

define VENC_OPENIPC_INSTALL_TARGET_CMDS
  $(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	cp $(VENC_OPENIPC_PKGDIR)/files/venc $(TARGET_DIR)/usr/bin/venc
	cp $(VENC_OPENIPC_PKGDIR)/files/telemetry $(TARGET_DIR)/usr/bin/telemetry
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
	cp $(VENC_OPENIPC_PKGDIR)/files/S98venc $(TARGET_DIR)/etc/init.d/S98venc
  $(INSTALL) -m 755 -d $(TARGET_DIR)/root
	cp $(VENC_OPENIPC_PKGDIR)/files/channels.sh $(TARGET_DIR)/root/channels.sh
endef

$(eval $(generic-package))
