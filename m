Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E8D33121C
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 08:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465308; cv=none; b=BLSXlw+doZdIrI8jbrAdhCjeXXyFbA1j2v9RIqsNF5LUgBG3QbF6nbzFde9WaEAwbRvX2bTlWqvxKg3GxYgDaPPPJ14tNT3X0W6imtOQFTcJcaD46s9j5pxwcQgXOqDw2sPBJoUJeQz/jAstkbtT5rpTRR7xlWvAvqcvqMYSQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465308; c=relaxed/simple;
	bh=5jQe/ELsWIEtSAtdSLXJZ3pXL/KkMM3UR5Cf4a8rtP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xpt5g1fuiq8s0sLY7GWzsQY/i8Yg+ProKcRM5aH4VNtyGpwOyQJ4YYIKEdgry3T08kWiW5D3oKbwgEmExuYVTfKvxqs9WQqPSJlTmaeaBQ+Y4kcdLKJnSRVxz/IE8riXYoxv30dJb4Xg38aHlbpL2eII0O4/RbFUhJbQnj7Z+GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGRDNDHs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/vyEyMQp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGRDNDHs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/vyEyMQp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGRDNDHs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/vyEyMQp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGRDNDHs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/vyEyMQp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 21AE2336B3;
	Thu, 15 Jan 2026 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI8rE6vHHpVDEeTPK2WJWmd2EG/kNBS2EFH/uaRkj9w=;
	b=DGRDNDHssvJrfyPDbHrulbFRCW+DtPXu7jCdG7+HieX+fXyjb/BXziC5kDLlB9DvL5FPHr
	lXvY+gV9eXzRksjJoIEAtENkpn7CvjVS4TtXFfHNh9Sk0oIfGU4GdfJ3SvSg16mG4vz4ur
	kFzJ/RhND3vYizbsfS0fi19cpswutFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI8rE6vHHpVDEeTPK2WJWmd2EG/kNBS2EFH/uaRkj9w=;
	b=/vyEyMQp2XEw2aa8Hcf+hSncBuvy1VeM0NbeSoRvCPr07G9Eqdt0xotYUI91I1S9znq6kc
	gOAaNC7hQdE3+nBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI8rE6vHHpVDEeTPK2WJWmd2EG/kNBS2EFH/uaRkj9w=;
	b=DGRDNDHssvJrfyPDbHrulbFRCW+DtPXu7jCdG7+HieX+fXyjb/BXziC5kDLlB9DvL5FPHr
	lXvY+gV9eXzRksjJoIEAtENkpn7CvjVS4TtXFfHNh9Sk0oIfGU4GdfJ3SvSg16mG4vz4ur
	kFzJ/RhND3vYizbsfS0fi19cpswutFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qI8rE6vHHpVDEeTPK2WJWmd2EG/kNBS2EFH/uaRkj9w=;
	b=/vyEyMQp2XEw2aa8Hcf+hSncBuvy1VeM0NbeSoRvCPr07G9Eqdt0xotYUI91I1S9znq6kc
	gOAaNC7hQdE3+nBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB3973EA65;
	Thu, 15 Jan 2026 08:21:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6AJsMIyjaGkjBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:32 +0000
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
Subject: [PATCH v2 03/12] firmware: google: framebuffer: Init memory resource with helper macro
Date: Thu, 15 Jan 2026 08:57:13 +0100
Message-ID: <20260115082128.12460-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115082128.12460-1-tzimmermann@suse.de>
References: <20260115082128.12460-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Initialize framebuffer memory resource with DEFINE_RES_MEM() instead
of open-coding the setup.

While at it, drop the resource name to make the kernel use the device
name of the simple-framebuffer device for the resource. The latter
includes a device number. While the meaning of the resource name is
somewhat fuzzy and varies across entries in /proc/iomem, showing the
device name seems more helpful than showing a fixed name.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

