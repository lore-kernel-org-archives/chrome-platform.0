Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E9A2BD022
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126943; cv=none; b=uL5M74P4p6/+W5PMjbscb3gfEtxPE7XkjeyqPJ83FpEc9OQN2GTuUjYZ9coJQJ2aoosemQcvEhMLME8zB3nM3/L2ZWF4c1GtEm/xoehHLJdj7vgyFt5CYe4L1DGs5FRgmUg6oGT0JKwXU/HXTixjrsvR9Kt8s6WVhZKRv2d5RGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126943; c=relaxed/simple;
	bh=JuXCHL/S2CPR9XKsZUPcLN6I9PSUMdVGYpb7UkkHnLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGDG64kx6SqGEhHfGoIjHhwqUcCTBeoXlgUZvBxZ5voRtd7xUe+kov4NtgLpDwK/AxBqsMwOBVPDId52aWyyEtdhwNC+V5VOQ9YfjC/GYbw9NzcbPm9n6LN4XiFouFocWdvDfDNkA+13NdYf7p/iBA2D0vtfacFtIh3VcmjhfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Odh5pY+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MrZViEif; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Odh5pY+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MrZViEif; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Odh5pY+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MrZViEif";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Odh5pY+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MrZViEif"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 70E735BCCA;
	Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8W1YvhOq8g7YlbsdDLFAp6o4z96Ka/OvuBJlFbu9/Q=;
	b=1Odh5pY+LeZ+OIBS2dXjxkXkA+i/OrGxcs1WZmnxRUIj2X+XZWMwDTzDD5vQRWspfkkEl0
	Px47WTqmrM3E2cjbW5nFOaVxwQJLnd1clIyFjM1O5wxXa0eNRMe3e2pXJ2kY0NI7AC/AK6
	1yMoi8QndwaOVRXnnzoONOe4AQbauCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8W1YvhOq8g7YlbsdDLFAp6o4z96Ka/OvuBJlFbu9/Q=;
	b=MrZViEifuYYeS8gxqK4doK8FgVFN+0gqJxzVjLYlFngxVlyrrDzka31awMlJPfjUe2unFb
	myvU7Cyc7v/bN1Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8W1YvhOq8g7YlbsdDLFAp6o4z96Ka/OvuBJlFbu9/Q=;
	b=1Odh5pY+LeZ+OIBS2dXjxkXkA+i/OrGxcs1WZmnxRUIj2X+XZWMwDTzDD5vQRWspfkkEl0
	Px47WTqmrM3E2cjbW5nFOaVxwQJLnd1clIyFjM1O5wxXa0eNRMe3e2pXJ2kY0NI7AC/AK6
	1yMoi8QndwaOVRXnnzoONOe4AQbauCM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126928;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L8W1YvhOq8g7YlbsdDLFAp6o4z96Ka/OvuBJlFbu9/Q=;
	b=MrZViEifuYYeS8gxqK4doK8FgVFN+0gqJxzVjLYlFngxVlyrrDzka31awMlJPfjUe2unFb
	myvU7Cyc7v/bN1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18FB03EA62;
	Tue,  3 Feb 2026 13:55:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yA7oBFD+gWlGDwAAD6G6ig
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
Subject: [PATCH v3 05/12] firmware: google: framebuffer: Fix dependencies
Date: Tue,  3 Feb 2026 14:52:24 +0100
Message-ID: <20260203135519.417931-6-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

The framebuffer on the coreboot bus represents an entry in the
coreboot payload table; not the actual device. [1] Hence it must
not depend on any other driver setting.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/dri-devel/CAODwPW9_ym3E4za3yoUAs0+1sQfaKTDOau4Oh9Zm8+2uvYVgFQ@mail.gmail.com/ # [1]
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/firmware/google/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/google/Kconfig b/drivers/firmware/google/Kconfig
index 41b78f5cb735..3ab3e089328b 100644
--- a/drivers/firmware/google/Kconfig
+++ b/drivers/firmware/google/Kconfig
@@ -59,11 +59,11 @@ config GOOGLE_MEMCONSOLE_X86_LEGACY
 
 config GOOGLE_FRAMEBUFFER_COREBOOT
 	tristate "Coreboot Framebuffer"
-	depends on FB_SIMPLE || DRM_SIMPLEDRM
 	depends on GOOGLE_COREBOOT_TABLE
 	help
 	  This option enables the kernel to search for a framebuffer in
-	  the coreboot table.  If found, it is registered with simplefb.
+	  the coreboot table.  If found, it is registered with a platform
+	  device of type simple-framebuffer.
 
 config GOOGLE_MEMCONSOLE_COREBOOT
 	tristate "Firmware Memory Console"
-- 
2.52.0

