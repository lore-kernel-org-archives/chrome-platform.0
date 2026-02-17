Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9456F36CE0A
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343930; cv=none; b=kUUSA1oUMvQWavFwoBC+ODDYDs3uGuH3jNN+i0AeF23WFvfmkhSDXS+mHF+9RmzM/UuF9qCx8PSCMf3hpVxxumv0TV7WtB+v9vQpDBM6BS1/8M59XIh4N5x6//mnOgncoAxJw86MJgxf8f86nKPKN9QEacMfVRFpq2Pbce1vG9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343930; c=relaxed/simple;
	bh=Xes+67Kf94eA4bNzKyiXPD/wS2arWWSD33HuGj8P008=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5593IATDdGyiVFRvGB7apdKf6K/j7FqWggA9EuT9qdfP9qqmz7kMvAt1dKKqCaSXbZQ8wFQOCidvwAxLdlOTfkfunBHMznP6lZXyg97sqxepw2nlFlUNrf/zgt9UcbkIrP6ZS0kXtRdqYV6olllnz28CW5RUzZTOWb0y4Tl6j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m/8WeFY1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lSvTSLbA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m/8WeFY1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lSvTSLbA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m/8WeFY1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lSvTSLbA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m/8WeFY1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lSvTSLbA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64A655BD1C;
	Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=m/8WeFY1Oz8X5u3QqjWi/Vug4E+5BxVhzv4A9RuLoNVINSXwP+tSrcnlXDafW1nfB7ltiQ
	7whPRdiYR3mRRlA7nzAYWB9DDZXzyzAaIlpxQJoZc3tEfzq0csrs1YG8hwHd87slN+mMEU
	IPvgTLZiVWz7joSFCtjE2UvSX8FdisU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=lSvTSLbA4rWEvth4Bonl4QAEH/P0+eKZXzqHpKTz69XmdT+bTc+uG/ZAMxNDsCWuzX0cEO
	OoCmzl29C2jGGDDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="m/8WeFY1";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lSvTSLbA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343923; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=m/8WeFY1Oz8X5u3QqjWi/Vug4E+5BxVhzv4A9RuLoNVINSXwP+tSrcnlXDafW1nfB7ltiQ
	7whPRdiYR3mRRlA7nzAYWB9DDZXzyzAaIlpxQJoZc3tEfzq0csrs1YG8hwHd87slN+mMEU
	IPvgTLZiVWz7joSFCtjE2UvSX8FdisU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343923;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=lSvTSLbA4rWEvth4Bonl4QAEH/P0+eKZXzqHpKTz69XmdT+bTc+uG/ZAMxNDsCWuzX0cEO
	OoCmzl29C2jGGDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 06F7D3EA66;
	Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ULd/ADOQlGk9PgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:43 +0000
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
Subject: [PATCH v4 06/12] firmware: google: Init coreboot bus with subsys_initcall()
Date: Tue, 17 Feb 2026 16:56:16 +0100
Message-ID: <20260217155836.96267-7-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_TWO(0.00)[2];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email,chromium.org:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 64A655BD1C

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
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
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

