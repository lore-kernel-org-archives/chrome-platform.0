Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5E3500976
	for <chrome-platform@lists.linux.dev>; Thu,  8 Jan 2026 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767883879; cv=none; b=p1oODD4g3+oyzbs45WwdsujG4zU+TgvD9RWrzTfmeXv90MMux0h4RvqLjW2fJZ/V3R/oGFOR1z83UrTwmtQFRKIuGZI4oR2vNf56ZNsjL2JW3I0f9oWQid+z9cJQg0alHY2tA1k4ZThwWriQCNX8qmj/Fh8RAm3a43KUdk7++uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767883879; c=relaxed/simple;
	bh=1yPBj1XQOZh7/5nx4vqKK3eII+jOEy7/L7hDxTshjds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khDx4/r+cXBG+lMX9KeAM83aLkoKjRd2KGrdQO3ycKAUO1evWOrbFm3WClZDGIdgxq2xyAN6pj70vmzdafgvgOfikK5dA2H29eO4jvDSDNLrLyP6nrpfyLvMjDtdYsBQVdrrvNtHQQvT6HbAxfmoDV5UtFikplGga923CKvJb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0KN9EMXi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F3vVqEP0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0KN9EMXi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F3vVqEP0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0KN9EMXi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F3vVqEP0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0KN9EMXi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F3vVqEP0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BDB8E5C7EB;
	Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767883862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9n4bXlrc1I++MXIKOiFKkepHP4+nUmKXFSfsYLmEOU=;
	b=0KN9EMXicFJx6AlYGekyoDAPFznknAJvEHeuknpZIqe5Ty6sTgh9QiadiH/EozCn2HTamo
	m8dMVSQ8dF/2fozcsxy408A/cL+3oUvOo3HOsZ4jTWv3j02D03dc45hNUntobaEjn2OuP8
	FoH4ax9OUsj8/rNBN10K4ohMVIQ6ChY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767883862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9n4bXlrc1I++MXIKOiFKkepHP4+nUmKXFSfsYLmEOU=;
	b=F3vVqEP0XMZmCuMcJg6YA70mgzp3ERkq7kA8+vNaAJNbu/yMSbVaoU3KobWdW0qD/JKBMh
	n0Z2xgkkuW0tTMCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767883862; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9n4bXlrc1I++MXIKOiFKkepHP4+nUmKXFSfsYLmEOU=;
	b=0KN9EMXicFJx6AlYGekyoDAPFznknAJvEHeuknpZIqe5Ty6sTgh9QiadiH/EozCn2HTamo
	m8dMVSQ8dF/2fozcsxy408A/cL+3oUvOo3HOsZ4jTWv3j02D03dc45hNUntobaEjn2OuP8
	FoH4ax9OUsj8/rNBN10K4ohMVIQ6ChY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767883862;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9n4bXlrc1I++MXIKOiFKkepHP4+nUmKXFSfsYLmEOU=;
	b=F3vVqEP0XMZmCuMcJg6YA70mgzp3ERkq7kA8+vNaAJNbu/yMSbVaoU3KobWdW0qD/JKBMh
	n0Z2xgkkuW0tTMCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 775733EA63;
	Thu,  8 Jan 2026 14:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8K3wG1bEX2n0WQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 08 Jan 2026 14:51:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org,
	briannorris@chromium.org,
	jwerner@chromium.org,
	javierm@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/8] firmware: google: Init coreboot bus with subsys_initcall()
Date: Thu,  8 Jan 2026 15:19:42 +0100
Message-ID: <20260108145058.56943-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108145058.56943-1-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,linux.intel.com,gmail.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO

Using module_init()/device_initcall() is too late to initialize
the coreboot bus, as there might already be drivers that depend
on it.

So far this hasn't been a problem, as coreboot controls all device
creation. Initializing the coreboot bus earlier in subsys_initcall()
will allow for external coreboot drivers to register themselves
with device_initcall(). Prepares coreboot to support additional
coreboot drivers from other subsystems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/google/coreboot_table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index c34426e5002d..3bee22d2a7b3 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -268,7 +268,7 @@ static void __exit coreboot_table_driver_exit(void)
 	bus_unregister(&coreboot_bus_type);
 }
 
-module_init(coreboot_table_driver_init);
+subsys_initcall(coreboot_table_driver_init);
 module_exit(coreboot_table_driver_exit);
 
 MODULE_AUTHOR("Google, Inc.");
-- 
2.52.0

