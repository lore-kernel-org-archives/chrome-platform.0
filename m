Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4E2326948
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126937; cv=none; b=BvpAD8BXK1bp3OVvrhC9U8lr5Tu7vMdwaFDVAvukGb2i3KNAVgJw2sRWCOpQ+qiuFB2BapRdwmhTZAKYFWG8OQVCMTn14CZS0QMellzCucbPxnN5shYHMxsDEBV8A8XVN3BMj1v0HOirNB2S+d5fETwGXeq8noXWqSTIWHimX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126937; c=relaxed/simple;
	bh=myPFtWtgZzD+AouMcr7f9q3t6NhDp7eYP8Y4mUfhBn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpPM3WCGHs73DaLDkZ7h8g+kpOt4F8hHq2LofWGL1zsFtnFyfUKX1KUoztIVwt+bl+785R23iWMjFWP3udKK1HJgNwGE7ysxo6IjyEptiQXzs98OOsHH6GgYf61QzF5Ef5cO/AHsAle3NaxcBNrFo1lJOgyl1PkHX/i4Vv1Flgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jEp/ifCr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PRKh7GBo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jEp/ifCr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PRKh7GBo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jEp/ifCr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PRKh7GBo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jEp/ifCr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PRKh7GBo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BE1895BCC9;
	Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=jEp/ifCr13E1JuyjLo8z43EPEraBoBLQ2LZOLqZjOVduSAFTQBIdZSsxAkTR5757SiEgjV
	7eDpV+7LuiWKf/0ANwFxMtNEnbu0QY2u/+pnU2+BfTQDTsjkMTiyYIiXUfNG2MEjMuKJlV
	m3UrZ4evURgCOF8aeWNkoA9nqhXwqvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=PRKh7GBomvurknelJIuLFxNNuGGPGj5YpDiTHl7Rd/lWd1IlCr+dXDLfo+NUQs5RCjsz2M
	C1GWArI/4qO3aFCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="jEp/ifCr";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PRKh7GBo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=jEp/ifCr13E1JuyjLo8z43EPEraBoBLQ2LZOLqZjOVduSAFTQBIdZSsxAkTR5757SiEgjV
	7eDpV+7LuiWKf/0ANwFxMtNEnbu0QY2u/+pnU2+BfTQDTsjkMTiyYIiXUfNG2MEjMuKJlV
	m3UrZ4evURgCOF8aeWNkoA9nqhXwqvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=PRKh7GBomvurknelJIuLFxNNuGGPGj5YpDiTHl7Rd/lWd1IlCr+dXDLfo+NUQs5RCjsz2M
	C1GWArI/4qO3aFCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6528B3EA64;
	Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eAOBF0/+gWlGDwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:27 +0000
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
Subject: [PATCH v3 03/12] firmware: google: framebuffer: Init memory resource with helper macro
Date: Tue,  3 Feb 2026 14:52:22 +0100
Message-ID: <20260203135519.417931-4-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: BE1895BCC9
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

Initialize framebuffer memory resource with DEFINE_RES_MEM() instead
of open-coding the setup.

While at it, drop the resource name to make the kernel use the device
name of the simple-framebuffer device for the resource. The latter
includes a device number. While the meaning of the resource name is
somewhat fuzzy and varies across entries in /proc/iomem, showing the
device name seems more helpful than showing a fixed name.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/firmware/google/framebuffer-coreboot.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index f44183476ed7..767515a30a52 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -26,7 +26,6 @@ static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 static int framebuffer_probe(struct coreboot_device *dev)
 {
 	int i;
-	u32 length;
 	struct lb_framebuffer *fb = &dev->framebuffer;
 	struct platform_device *pdev;
 	struct resource res;
@@ -53,6 +52,11 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (!fb->physical_address)
 		return -ENODEV;
 
+	res = DEFINE_RES_MEM(fb->physical_address,
+			     PAGE_ALIGN(fb->y_resolution * fb->bytes_per_line));
+	if (res.end <= res.start)
+		return -EINVAL;
+
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (fb->bits_per_pixel     == formats[i].bits_per_pixel &&
 		    fb->red_mask_pos       == formats[i].red.offset &&
@@ -66,15 +70,6 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (!pdata.format)
 		return -ENODEV;
 
-	memset(&res, 0, sizeof(res));
-	res.flags = IORESOURCE_MEM;
-	res.name = "Coreboot Framebuffer";
-	res.start = fb->physical_address;
-	length = PAGE_ALIGN(fb->y_resolution * fb->bytes_per_line);
-	res.end = res.start + length - 1;
-	if (res.end <= res.start)
-		return -EINVAL;
-
 	pdev = platform_device_register_resndata(&dev->dev,
 						 "simple-framebuffer", 0,
 						 &res, 1, &pdata,
-- 
2.52.0

