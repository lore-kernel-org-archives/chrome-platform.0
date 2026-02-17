Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FA736CE0A
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343925; cv=none; b=c4iFakeYwjakiYSo9RMWNMUBBAHRe58+E3mn3EJeC52iUKmFohyp+ycz1GRgU4AMEO1aQi2KW2wRjNw6AeQPN6oYLzDKAvv7vUvTmViPJn2YU62Of8AThH9yj8f2vbzQM5eRdhoQkFhPM0Lh/3pJGDYmAomXIx3FA0Pc9jebciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343925; c=relaxed/simple;
	bh=myPFtWtgZzD+AouMcr7f9q3t6NhDp7eYP8Y4mUfhBn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDKnZ6AM11wOy0PLY54zoyohqxTAPUou6YNiVVPN1wp4dMdR+Qxxng5EDcQt4TbRPKkD3kRRKR/wmkv4u+bB6EJ/JZ5suYnG5WA7KzfQYg5W5OLo9n2z7c0NxhhB5xhONICjtHu2p7LKcH8j2eICRi+Ng2EohP9fjktY8RsUUuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=io63cU5g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6JEO41Ly; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=io63cU5g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6JEO41Ly; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="io63cU5g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6JEO41Ly";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="io63cU5g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6JEO41Ly"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4380B5BCDE;
	Tue, 17 Feb 2026 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=io63cU5gavOP4EsmrC30BblrFhLcGx8dwHaWUjgJx9oJr8jW04nuV8cHvnSGegRTWcmG4H
	C9NmPLOHZduCjVMNOo7QzimP5n16XjLYBh2Chx27u8j7Dxr+HyE5WrgRUk3PeMZJs5t7yH
	N9OBQD5aInd8gvTYug2HYoP1F/k5WXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=6JEO41LyzJLcSXLCVtndmodagGfCI8sJJgGt3DsJy5OhWIvdcrUSUjNrsGCTbcYJcJ5sgi
	W2nl/Kf6aIygAFAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=io63cU5g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6JEO41Ly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=io63cU5gavOP4EsmrC30BblrFhLcGx8dwHaWUjgJx9oJr8jW04nuV8cHvnSGegRTWcmG4H
	C9NmPLOHZduCjVMNOo7QzimP5n16XjLYBh2Chx27u8j7Dxr+HyE5WrgRUk3PeMZJs5t7yH
	N9OBQD5aInd8gvTYug2HYoP1F/k5WXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
	b=6JEO41LyzJLcSXLCVtndmodagGfCI8sJJgGt3DsJy5OhWIvdcrUSUjNrsGCTbcYJcJ5sgi
	W2nl/Kf6aIygAFAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAFCB3EA65;
	Tue, 17 Feb 2026 15:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oIw/NDGQlGk9PgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:41 +0000
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
Subject: [PATCH v4 03/12] firmware: google: framebuffer: Init memory resource with helper macro
Date: Tue, 17 Feb 2026 16:56:13 +0100
Message-ID: <20260217155836.96267-4-tzimmermann@suse.de>
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
X-Rspamd-Queue-Id: 4380B5BCDE
X-Spam-Flag: NO
X-Spam-Score: -3.01
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

