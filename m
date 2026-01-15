Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EF314BF92
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465322; cv=none; b=JCJstDU1qLkWe3h4CzufvpQnRUha2TBFA+2buNGiYUjz3YNfjJA0ffOFrfrqIda+ea3ctAIk43Uyyd+a7fi1pZQ8STY5xHIKgiyxMkgYglRN1fGGka9sRpf0r4yRb4f3yjj4WKaGaEvdCPOjCZ724HG2di/Pjs4MDqQUvtksuPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465322; c=relaxed/simple;
	bh=m7tU1BOeE1MPijlvSrEANSJc2xMcdzgnDmg/hCNH55w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k17f19IBvUg/d5h9n2H6LUSlb2tJdxCrsdO+L5iM5gW9gWeEHrhR7SxUPRPnlREkFUIcp+4sjaye2QxkB+SCrK49kWviIYxKPphXfItZeUBc6GcDsKspgaZs4+OOOEX+wsjjxR6ZC8hWTXdalTbWdvqyyJ4UUflAjxlow0MEEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uM3hrQaN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5bq1qcHx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uM3hrQaN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5bq1qcHx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uM3hrQaN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5bq1qcHx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uM3hrQaN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5bq1qcHx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2442333747;
	Thu, 15 Jan 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONFkpal61itzrlAhQL7tPQAtE3AnH+QkVtkROqr1ktE=;
	b=uM3hrQaNEAHo6XV/LT+rTa5DtK+DcB6WFnmh/z9YcUmgGACGi788X/UCFerOHvGKfMT5Ml
	Znc0vRnQqCsFXHrRRrspF/4MGTg7OUDXaFEInLMMffwcrS95AWw2x4RPqSfhJyuZxdKhuy
	85yYSaQ3ZA4ojgMU+zjOtOP5RiUORV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONFkpal61itzrlAhQL7tPQAtE3AnH+QkVtkROqr1ktE=;
	b=5bq1qcHx2kQ+OKUvZX7Hjqn8EahyHs99eIHpNUbgH9HzsamhunuBvnc/Fwx1oxqM2R0z7I
	Q5MVqycFGj5rR8Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uM3hrQaN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5bq1qcHx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465294; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONFkpal61itzrlAhQL7tPQAtE3AnH+QkVtkROqr1ktE=;
	b=uM3hrQaNEAHo6XV/LT+rTa5DtK+DcB6WFnmh/z9YcUmgGACGi788X/UCFerOHvGKfMT5Ml
	Znc0vRnQqCsFXHrRRrspF/4MGTg7OUDXaFEInLMMffwcrS95AWw2x4RPqSfhJyuZxdKhuy
	85yYSaQ3ZA4ojgMU+zjOtOP5RiUORV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465294;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONFkpal61itzrlAhQL7tPQAtE3AnH+QkVtkROqr1ktE=;
	b=5bq1qcHx2kQ+OKUvZX7Hjqn8EahyHs99eIHpNUbgH9HzsamhunuBvnc/Fwx1oxqM2R0z7I
	Q5MVqycFGj5rR8Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE0C63EA63;
	Thu, 15 Jan 2026 08:21:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGQfMY2jaGkjBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:33 +0000
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
Subject: [PATCH v2 06/12] firmware: google: Init coreboot bus with subsys_initcall()
Date: Thu, 15 Jan 2026 08:57:16 +0100
Message-ID: <20260115082128.12460-7-tzimmermann@suse.de>
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
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 2442333747
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/firmware/google/coreboot_table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 882db32e51be..26d93781e64a 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -251,7 +251,7 @@ static void __exit coreboot_table_driver_exit(void)
 	bus_unregister(&coreboot_bus_type);
 }
 
-module_init(coreboot_table_driver_init);
+subsys_initcall(coreboot_table_driver_init);
 module_exit(coreboot_table_driver_exit);
 
 MODULE_AUTHOR("Google, Inc.");
-- 
2.52.0

