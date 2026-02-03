Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ACC3A1A2E
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126975; cv=none; b=R917Ky1JMIziosGVSqfNM9k1DqUbAE4qvaFSyeBVF0A8icoMKtxXetze4CN0vlP6bDUOkODjy5X1dvridBctcd2OCZT1FxmN48PWRlYZvPgFY3POfS/ebax6ApRG9PDsCYYHVMRo/UltVTACmuBWfjfpsszzm8M588c8H08Y5uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126975; c=relaxed/simple;
	bh=i1hIWQOmYSSWGhQ405NhKjeurgni48sN7Mt7KoEzZh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqDof7el9uE5bAQeAqXfgy8AHK116lfLuj7MArWTTY9ZzCUl4Do5lfZaSIqbsAhNyFfXRBHfkt5YMr5+dEueWh+L//Tnz3TgDQDgdhXAZgctMpgbRSEBDO6Mi/2S7gU9vYTNRUwKDa/TFOjmslrXa55zniVmT9hp8YDhDZrRX80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mtUib12A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tbpCO+s/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mtUib12A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tbpCO+s/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mtUib12A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbpCO+s/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mtUib12A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tbpCO+s/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D598A5BCD1;
	Tue,  3 Feb 2026 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
	b=mtUib12A43mkajv5rTDchFPcEQvp9109SoKs8w8aIxpDMZXztmCfOZg+YeCmfkB07n3qgA
	Evt8OON6BhiPrKIonPXNssIBOo2PU2NutOS5AYaNk7vbBnKnPgoBnosclrSBmvur8aUsOG
	0JJmy2XTszfUd5m6poHrT3hVszck09k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
	b=tbpCO+s//oelNpZ5RgCxZNfor3JgK4Bi3QoM8W3HJ9s98kFqremGl27awCqGLjK8PyIucq
	HGnntH3buP4834BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
	b=mtUib12A43mkajv5rTDchFPcEQvp9109SoKs8w8aIxpDMZXztmCfOZg+YeCmfkB07n3qgA
	Evt8OON6BhiPrKIonPXNssIBOo2PU2NutOS5AYaNk7vbBnKnPgoBnosclrSBmvur8aUsOG
	0JJmy2XTszfUd5m6poHrT3hVszck09k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JvSlecGw1g6arIANSsIRSRrSzxuSgdqZjf1K88KFbt4=;
	b=tbpCO+s//oelNpZ5RgCxZNfor3JgK4Bi3QoM8W3HJ9s98kFqremGl27awCqGLjK8PyIucq
	HGnntH3buP4834BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7E84B3EA63;
	Tue,  3 Feb 2026 13:55:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GAOzHVL+gWlGDwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org,
	briannorris@chromium.org,
	jwerner@chromium.org,
	javierm@redhat.com,
	samuel@sholland.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 12/12] drm/sysfb: corebootdrm: Support panel orientation
Date: Tue,  3 Feb 2026 14:52:31 +0100
Message-ID: <20260203135519.417931-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135519.417931-1-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLf8s8spogujn9h9roxabhn3pd)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO

Add fields and constants for coreboot framebuffer orientation. Set
corebootdrm's DRM connector state from the values. Not all firmware
provides orientation, so make it optional. Systems without, continue
to use unknown orientation.

v3:
- comment on _HAS_ORIENTATION semantics (Tzung-Bi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/gpu/drm/sysfb/corebootdrm.c | 30 +++++++++++++++++++++++++----
 include/linux/coreboot.h            | 13 +++++++++++++
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/corebootdrm.c b/drivers/gpu/drm/sysfb/corebootdrm.c
index 745318580a5d..5dc6f3c76f7b 100644
--- a/drivers/gpu/drm/sysfb/corebootdrm.c
+++ b/drivers/gpu/drm/sysfb/corebootdrm.c
@@ -110,6 +110,26 @@ static phys_addr_t corebootdrm_get_address_fb(struct drm_device *dev, resource_s
 	return fb->physical_address;
 }
 
+static enum drm_panel_orientation corebootdrm_get_orientation_fb(struct drm_device *dev,
+								 const struct lb_framebuffer *fb)
+{
+	if (!LB_FRAMEBUFFER_HAS_ORIENTATION(fb))
+		return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+
+	switch (fb->orientation) {
+	case LB_FRAMEBUFFER_ORIENTATION_NORMAL:
+		return DRM_MODE_PANEL_ORIENTATION_NORMAL;
+	case LB_FRAMEBUFFER_ORIENTATION_BOTTOM_UP:
+		return DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP;
+	case LB_FRAMEBUFFER_ORIENTATION_LEFT_UP:
+		return DRM_MODE_PANEL_ORIENTATION_LEFT_UP;
+	case LB_FRAMEBUFFER_ORIENTATION_RIGHT_UP:
+		return DRM_MODE_PANEL_ORIENTATION_RIGHT_UP;
+	}
+
+	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -168,7 +188,8 @@ static const struct drm_mode_config_funcs corebootdrm_mode_config_funcs = {
 	DRM_SYSFB_MODE_CONFIG_FUNCS,
 };
 
-static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
+static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev,
+					enum drm_panel_orientation orientation)
 {
 	struct drm_sysfb_device *sysfb = &cdev->sysfb;
 	struct drm_device *dev = &sysfb->dev;
@@ -234,8 +255,7 @@ static int corebootdrm_mode_config_init(struct corebootdrm_device *cdev)
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &corebootdrm_connector_helper_funcs);
-	drm_connector_set_panel_orientation_with_quirk(connector,
-						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+	drm_connector_set_panel_orientation_with_quirk(connector, orientation,
 						       width, height);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
@@ -276,6 +296,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	int width, height, pitch;
 	resource_size_t size;
 	phys_addr_t address;
+	enum drm_panel_orientation orientation;
 	struct resource *res, *mem = NULL;
 	struct resource aperture;
 	void __iomem *screen_base;
@@ -320,6 +341,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	address = corebootdrm_get_address_fb(dev, size, fb);
 	if (!address)
 		return -EINVAL;
+	orientation = corebootdrm_get_orientation_fb(dev, fb);
 
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
@@ -375,7 +397,7 @@ static int corebootdrm_probe(struct platform_device *pdev)
 	 * DRM mode setting and registration
 	 */
 
-	ret = corebootdrm_mode_config_init(cdev);
+	ret = corebootdrm_mode_config_init(cdev, orientation);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index b51665165f9f..de9652e1a53f 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -47,6 +47,11 @@ struct lb_cbmem_entry {
 	u32 id;
 };
 
+#define LB_FRAMEBUFFER_ORIENTATION_NORMAL	0
+#define LB_FRAMEBUFFER_ORIENTATION_BOTTOM_UP	1
+#define LB_FRAMEBUFFER_ORIENTATION_LEFT_UP	2
+#define LB_FRAMEBUFFER_ORIENTATION_RIGHT_UP	3
+
 /* Describes framebuffer setup by coreboot */
 struct lb_framebuffer {
 	u32 tag;
@@ -65,6 +70,7 @@ struct lb_framebuffer {
 	u8  blue_mask_size;
 	u8  reserved_mask_pos;
 	u8  reserved_mask_size;
+	u8  orientation;
 };
 
 /*
@@ -74,4 +80,11 @@ struct lb_framebuffer {
 #define LB_FRAMEBUFFER_HAS_LFB(__fb) \
 	((__fb)->size >= offsetofend(struct lb_framebuffer, reserved_mask_size))
 
+/*
+ * True if the coreboot-provided data is large enough to hold information
+ * on the display orientation. False otherwise.
+ */
+#define LB_FRAMEBUFFER_HAS_ORIENTATION(__fb) \
+	((__fb)->size >= offsetofend(struct lb_framebuffer, orientation))
+
 #endif /* _LINUX_COREBOOT_H */
-- 
2.52.0

