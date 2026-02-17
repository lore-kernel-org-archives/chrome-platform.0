Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ADB36CE06
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343948; cv=none; b=d4QinR0jARwpPTH5fCCh6THjt4skSBYVztMRYq61wQqNY/A1V9FzR33FeRe+n33DP1eOyZEHKtmDB+GbX1SOHLkfvW+7ESuHVpbkoLAle6w0ToFsp4UICiEcOY1rYDADeMWRMzcWnO3xyJ+vL9KuY8gxlM6IoWKqTbD6NUit3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343948; c=relaxed/simple;
	bh=KS62OpcaC4CrrX9gB3XGOtbXTHN1flCulygIEjnKo08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YisgSZ6COG4lZrphBESOvfVhHF2iJHS41PMWIC9MZe0NCe0fU6bRIaUq9AlS+CDmYTEKLJeWuONsSCUuavvy3kVPKLnZ9j7UqXv6qx/kHQCgl3OkS0aypoRYsRI+l3XuWM9ADaYy+oJBL6cQK19Kh1CNXZdHtrduuC0FzfhIBNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s4BAOGS5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9czVcI0X; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=s4BAOGS5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9czVcI0X; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4BAOGS5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9czVcI0X";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s4BAOGS5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9czVcI0X"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA1A25BD53;
	Tue, 17 Feb 2026 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9npnIorpOQ/7JaeREJgGuIeoG5PYzNJaUSXuaS1fzHk=;
	b=s4BAOGS5Kpbm89YhN723qk3KpktVUfOFrZu8BW/l+KmADL8JdseV5JwM1xyyjy2iqTaro0
	459so/zi6AVzShvHPPzkrhS7sJuDEStkCSs2YBP9TeAl+EZ4uGSenJ+oEWQTj42xxMweSP
	bUx+2pWh6sI61TdPxNSxOq1wPkpHlME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9npnIorpOQ/7JaeREJgGuIeoG5PYzNJaUSXuaS1fzHk=;
	b=9czVcI0XVzzjRl+xft76lFGQMATp9fLiyjWa1hYFrwDX446x3qjG3aa0jb/xp+0YGeaZjP
	fzQvsD9wkG7LLQDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=s4BAOGS5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9czVcI0X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9npnIorpOQ/7JaeREJgGuIeoG5PYzNJaUSXuaS1fzHk=;
	b=s4BAOGS5Kpbm89YhN723qk3KpktVUfOFrZu8BW/l+KmADL8JdseV5JwM1xyyjy2iqTaro0
	459so/zi6AVzShvHPPzkrhS7sJuDEStkCSs2YBP9TeAl+EZ4uGSenJ+oEWQTj42xxMweSP
	bUx+2pWh6sI61TdPxNSxOq1wPkpHlME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9npnIorpOQ/7JaeREJgGuIeoG5PYzNJaUSXuaS1fzHk=;
	b=9czVcI0XVzzjRl+xft76lFGQMATp9fLiyjWa1hYFrwDX446x3qjG3aa0jb/xp+0YGeaZjP
	fzQvsD9wkG7LLQDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 487543EA66;
	Tue, 17 Feb 2026 15:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sHl6EDWQlGk9PgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:45 +0000
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
Subject: [PATCH v4 12/12] drm/sysfb: corebootdrm: Support panel orientation
Date: Tue, 17 Feb 2026 16:56:22 +0100
Message-ID: <20260217155836.96267-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217155836.96267-1-tzimmermann@suse.de>
References: <20260217155836.96267-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Queue-Id: AA1A25BD53
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

Add fields and constants for coreboot framebuffer orientation. Set
corebootdrm's DRM connector state from the values. Not all firmware
provides orientation, so make it optional. Systems without, continue
to use unknown orientation.

v3:
- comment on _HAS_ORIENTATION semantics (Tzung-Bi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Julius Werner <jwerner@chromium.org>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org> # coreboot
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
index 885da106fee3..5d40ca7a1d89 100644
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

