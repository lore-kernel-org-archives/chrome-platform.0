Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D18326948
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126949; cv=none; b=C7v8+pEF7nddGvDZsWBT1VFr/xarJA1MZqXONIJJXWVc15K4b74Vdzbxa6Oz4noaU3sgZ7cbCSJXMpXmLF1CDkTxIOK/DnjCzf92ylN+QHAbui47jBMI2tBMwsLNd1c+FJmgXRJuNpWu+9NLoT0ERckzMPuFepkmKtce/TYw+P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126949; c=relaxed/simple;
	bh=Xes+67Kf94eA4bNzKyiXPD/wS2arWWSD33HuGj8P008=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsdBzQQgKQnwLOuEp3iJDNoZZLNJfVgAJSiX62jcm/dnbmvjd7e71CG4MxNXNW3c6q/cucVMpbu7EJuoFaP8FMtBVThTa8P4tCWjgmX9E4H/+ujveA9eqnF1TZJj1+GOIKV9NPturJH6u9mw8Pl701X/AaeI97kdgdc17uz32Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JPalHk0p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7wCLObgJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JPalHk0p; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7wCLObgJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JPalHk0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7wCLObgJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JPalHk0p";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7wCLObgJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C4D775BCCC;
	Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=JPalHk0pJ+7cU/tOVkrkSuwg1NwLcU5zXbki/QuqQIBinzNAoFdwqIO9IYDlFgKFkYslIX
	xlDosQOAeKH82Lcj9SV5FT+8ubxiAqjqtUdXtlDyohFdBSmE2LHFaA0HqERZSC3o6iUloS
	DuV+PGMrU1peuwZVIMlfrZcQSArKxe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=7wCLObgJSNUiAGa3UZ0C1v/4Yi9kdaluyU9fGM/Rx20kEuUbmLGb08QoGjjvOUmS05x1zf
	0m4dyXHaeMo8CIAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=JPalHk0pJ+7cU/tOVkrkSuwg1NwLcU5zXbki/QuqQIBinzNAoFdwqIO9IYDlFgKFkYslIX
	xlDosQOAeKH82Lcj9SV5FT+8ubxiAqjqtUdXtlDyohFdBSmE2LHFaA0HqERZSC3o6iUloS
	DuV+PGMrU1peuwZVIMlfrZcQSArKxe8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ld7t4qNNobtnHi99lbfrnBdwHcjxOvn6d3Vey/eHElY=;
	b=7wCLObgJSNUiAGa3UZ0C1v/4Yi9kdaluyU9fGM/Rx20kEuUbmLGb08QoGjjvOUmS05x1zf
	0m4dyXHaeMo8CIAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CF033EA63;
	Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHRqGVD+gWlGDwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:28 +0000
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
Subject: [PATCH v3 06/12] firmware: google: Init coreboot bus with subsys_initcall()
Date: Tue,  3 Feb 2026 14:52:25 +0100
Message-ID: <20260203135519.417931-7-tzimmermann@suse.de>
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

