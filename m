Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E412C3768
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126969; cv=none; b=tX79WCDhjwi5UbnrNjeHDbgCsrlex7m83hQIIJRdNFlT0XmS/LMOwuj7U+B3fMZk0RUg/e/O72qgR2g/hwfXkW/bYy2QBZchoXmhGXNiWs0kA/a0jn6+yjxXbmqwh8J1ARrl+q0lOTrhWs48oLsbpTHvkN/NdasDVFHYRYQc4E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126969; c=relaxed/simple;
	bh=bDY/Zh0GG6R/2lTO15bfc1YoKv+M1v7YsqRLNp1RxZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHGAeEjwajFoO+/fxycWEWlC3BS82QWhNLl7LoxkKeq1Lv7NyyhjxNjEbULASj/aPE9faiNhUlasmJl7USgMf88Pq+zMx3n00Af2j4Yvdce7BwewdR2OFqCdsvGyuV88uwnBUUr74TSethNdx4leTDqrP1pHF/QSECTg7PxXrog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MReJIbXT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mSddxeZQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MReJIbXT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mSddxeZQ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MReJIbXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mSddxeZQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MReJIbXT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mSddxeZQ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3067D5BCD0;
	Tue,  3 Feb 2026 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
	b=MReJIbXTQAXx3Ss519dkogvzP4M4OPvlgIqjsWEfTs5pn44GToueSDZQqZ7wOPV+oPLzdQ
	sWUQnLwPxWsgXEi2lccLnlbCBo6ea/nCi5FC5RJoIrpe6sXRJw8ElHZQuyr60CESriue2y
	06vbzmvEqhHVJ0DHulk8zfWDZF7vGn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
	b=mSddxeZQCsNKdwbqwv8Xy79SYI2ENn69cAijHnBx7l5e+BLPZnEIdvXEPTUcVJzuo+16Kx
	7Q36/WkemMXsyOCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
	b=MReJIbXTQAXx3Ss519dkogvzP4M4OPvlgIqjsWEfTs5pn44GToueSDZQqZ7wOPV+oPLzdQ
	sWUQnLwPxWsgXEi2lccLnlbCBo6ea/nCi5FC5RJoIrpe6sXRJw8ElHZQuyr60CESriue2y
	06vbzmvEqhHVJ0DHulk8zfWDZF7vGn8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOaZGBgJ1mZ+urHLrOyGEWCExurs4lE0vtogqzscPP4=;
	b=mSddxeZQCsNKdwbqwv8Xy79SYI2ENn69cAijHnBx7l5e+BLPZnEIdvXEPTUcVJzuo+16Kx
	7Q36/WkemMXsyOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBC9F3EA63;
	Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aI2JMFH+gWlGDwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:29 +0000
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
Subject: [PATCH v3 10/12] drm/sysfb: Generalize pixel-format matching
Date: Tue,  3 Feb 2026 14:52:29 +0100
Message-ID: <20260203135519.417931-11-tzimmermann@suse.de>
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

Provide drm_sysfb_get_format(), a helper that finds a specific DRM
format from a list of pixel formats. The new function builds upon
drm_sysfb_get_format_si(), which finds the DRM format from a given
instance of struct screen_info. Now get the screen_info's pixel format
in the caller. Allows for matching pixel formats in drivers without
screen_info.

Convert the callers in efidrm and vesadrm to the new interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/gpu/drm/sysfb/drm_sysfb.c             | 24 +++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  8 ++---
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 30 -------------------
 drivers/gpu/drm/sysfb/efidrm.c                |  8 ++++-
 drivers/gpu/drm/sysfb/vesadrm.c               |  8 ++++-
 5 files changed, 42 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb.c b/drivers/gpu/drm/sysfb/drm_sysfb.c
index 308f82153b15..fbfb37d0fae1 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb.c
@@ -31,5 +31,29 @@ int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
 }
 EXPORT_SYMBOL(drm_sysfb_get_validated_int0);
 
+const struct drm_format_info *drm_sysfb_get_format(struct drm_device *dev,
+						   const struct drm_sysfb_format *formats,
+						   size_t nformats,
+						   const struct pixel_format *pixel)
+{
+	const struct drm_format_info *format = NULL;
+	size_t i;
+
+	for (i = 0; i < nformats; ++i) {
+		const struct drm_sysfb_format *f = &formats[i];
+
+		if (pixel_format_equal(pixel, &f->pixel)) {
+			format = drm_format_info(f->fourcc);
+			break;
+		}
+	}
+
+	if (!format)
+		drm_warn(dev, "No compatible color format found\n");
+
+	return format;
+}
+EXPORT_SYMBOL(drm_sysfb_get_format);
+
 MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index de96bfe7562c..b14df5b54bc9 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -36,6 +36,10 @@ int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
 				u64 value, u32 max);
 int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
 				 u64 value, u32 max);
+const struct drm_format_info *drm_sysfb_get_format(struct drm_device *dev,
+						   const struct drm_sysfb_format *formats,
+						   size_t nformats,
+						   const struct pixel_format *pixel);
 
 #if defined(CONFIG_SCREEN_INFO)
 int drm_sysfb_get_width_si(struct drm_device *dev, const struct screen_info *si);
@@ -48,10 +52,6 @@ int drm_sysfb_get_stride_si(struct drm_device *dev, const struct screen_info *si
 			    unsigned int width, unsigned int height, u64 size);
 u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
 				  unsigned int height, unsigned int stride, u64 size);
-const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
-						      const struct drm_sysfb_format *formats,
-						      size_t nformats,
-						      const struct screen_info *si);
 #endif
 
 /*
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
index 885864168c54..749290196c6a 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c
@@ -72,33 +72,3 @@ u64 drm_sysfb_get_visible_size_si(struct drm_device *dev, const struct screen_in
 	return drm_sysfb_get_validated_size0(dev, "visible size", vsize, size);
 }
 EXPORT_SYMBOL(drm_sysfb_get_visible_size_si);
-
-const struct drm_format_info *drm_sysfb_get_format_si(struct drm_device *dev,
-						      const struct drm_sysfb_format *formats,
-						      size_t nformats,
-						      const struct screen_info *si)
-{
-	const struct drm_format_info *format = NULL;
-	struct pixel_format pixel;
-	size_t i;
-	int ret;
-
-	ret = screen_info_pixel_format(si, &pixel);
-	if (ret)
-		return NULL;
-
-	for (i = 0; i < nformats; ++i) {
-		const struct drm_sysfb_format *f = &formats[i];
-
-		if (pixel_format_equal(&pixel, &f->pixel)) {
-			format = drm_format_info(f->fourcc);
-			break;
-		}
-	}
-
-	if (!format)
-		drm_warn(dev, "No compatible color format found\n");
-
-	return format;
-}
-EXPORT_SYMBOL(drm_sysfb_get_format_si);
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 1b683d55d6ea..ee525f330441 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -45,8 +45,14 @@ static const struct drm_format_info *efidrm_get_format_si(struct drm_device *dev
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
 		{ PIXEL_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, },
 	};
+	struct pixel_format pixel;
+	int ret;
+
+	ret = screen_info_pixel_format(si, &pixel);
+	if (ret)
+		return NULL;
 
-	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
+	return drm_sysfb_get_format(dev, formats, ARRAY_SIZE(formats), &pixel);
 }
 
 static u64 efidrm_get_mem_flags(struct drm_device *dev, resource_size_t start,
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 7b7b5ba26317..b8c16ae3faad 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -49,8 +49,14 @@ static const struct drm_format_info *vesadrm_get_format_si(struct drm_device *de
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
 		{ PIXEL_FORMAT_C8, DRM_FORMAT_C8, },
 	};
+	struct pixel_format pixel;
+	int ret;
+
+	ret = screen_info_pixel_format(si, &pixel);
+	if (ret)
+		return NULL;
 
-	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
+	return drm_sysfb_get_format(dev, formats, ARRAY_SIZE(formats), &pixel);
 }
 
 /*
-- 
2.52.0

