#############################################################
#
# baresip-openipc
#
#############################################################

BARESIP_OPENIPC_SITE = $(call github,baresip,baresip,$(BARESIP_OPENIPC_VERSION))
BARESIP_OPENIPC_VERSION = v3.14.0

BARESIP_OPENIPC_DEPENDENCIES = libre-openipc webrtc-audio-processing-openipc mosquitto

BARESIP_OPENIPC_CONF_OPTS = \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG -s" \
	-DUSE_MBEDTLS=ON \
	-DWEBRTC_AEC_INCLUDE_DIR=$(WEBRTC_AUDIO_PROCESSING_OPENIPC_DIR) \
	-DMOSQUITTO_INCLUDE_DIR=$(MOSQUITTO_DIR)

define BARESIP_OPENIPC_INSTALL_CONF
	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 755 -t $(TARGET_DIR)/etc/init.d $(BARESIP_OPENIPC_PKGDIR)/files/S97baresip

	$(INSTALL) -m 755 -d $(TARGET_DIR)/etc/baresip
	$(INSTALL) -m 644 $(BARESIP_OPENIPC_PKGDIR)/files/accounts $(TARGET_DIR)/etc/baresip/accounts.orig
	$(INSTALL) -m 644 $(BARESIP_OPENIPC_PKGDIR)/files/config $(TARGET_DIR)/etc/baresip/config.orig
	$(INSTALL) -m 644 $(BARESIP_OPENIPC_PKGDIR)/files/contacts $(TARGET_DIR)/etc/baresip/contacts.orig

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/bin $(BARESIP_OPENIPC_PKGDIR)/files/dtmf_0.sh
	ln -sf dtmf_0.sh $(TARGET_DIR)/usr/bin/dtmf_1.sh
	ln -sf dtmf_0.sh $(TARGET_DIR)/usr/bin/dtmf_2.sh
	ln -sf dtmf_0.sh $(TARGET_DIR)/usr/bin/dtmf_3.sh

	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/share/baresip
	$(INSTALL) -m 644 $(@D)/share/*.wav $(TARGET_DIR)/usr/share/baresip
endef


BARESIP_OPENIPC_POST_INSTALL_TARGET_HOOKS += BARESIP_OPENIPC_INSTALL_CONF

$(eval $(cmake-package))
