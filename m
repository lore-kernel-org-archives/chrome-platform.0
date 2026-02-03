Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95332C3768
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126963; cv=none; b=cOpS2kpirp+u3PUTqvttrqxqJPlxSkm1L15kFJfUM338zlk1uKOB01Vge9XnxFSCAQIIatwKpp4OI2KgAwpvjGntlddfd6qgizOSfaNMRCBsfP8DDFO1BBKfXoxSpXa3b+5HQGh8Ntd5iXSuT31Y1FaqF86Kz51co1PXiQFz82U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126963; c=relaxed/simple;
	bh=BrjQrvUx/oyBrdmxUDVKk9WIGBrmBkYDsgNhoTvgNQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FXKJc0l/RK6ReyjBiHjoSSayC8e17JBo8ncwgKWzmQXAboInsQhhChTDileK/IvnTm+Gk2jPFJSit5sH7EprOpjHZtOaeU2GlKQvWOrH+jwZDyYBXg6Eq6zYoc9SyZDee/Td5NLq7nRu2Y0rc99xvtxXVt6WM04CmBwBTkNfpUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tAbGSvkk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xxEgkmpn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tAbGSvkk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xxEgkmpn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tAbGSvkk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xxEgkmpn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tAbGSvkk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xxEgkmpn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF99F5BCCE;
	Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
	b=tAbGSvkke1HRLYCwaVhb0DrlQglWX7cv54hCqZqtIJSWaS4JzUH7Gn6s1wCRCmxg6yd6Ud
	UF/nhOmg/ukbKXiIbKueC4pwMvltbJn6PZoA2i0qUpd5EvRQpTTKna9dW4wezPqbHZ+2ai
	y4sTtGbhppipSW+GnmP/uPESHgzerw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
	b=xxEgkmpnMQp5Xg6ZD7D42De9tWvcptz488mEvFBYlAFmbC7qwRW8iJhMrSZUR2ajyWHyS6
	SczKcNyjvEOFhAAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
	b=tAbGSvkke1HRLYCwaVhb0DrlQglWX7cv54hCqZqtIJSWaS4JzUH7Gn6s1wCRCmxg6yd6Ud
	UF/nhOmg/ukbKXiIbKueC4pwMvltbJn6PZoA2i0qUpd5EvRQpTTKna9dW4wezPqbHZ+2ai
	y4sTtGbhppipSW+GnmP/uPESHgzerw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qw+rNVDeI6QXcb+Gq77DKNfmbVsdqpnDsYMcvjnwoFA=;
	b=xxEgkmpnMQp5Xg6ZD7D42De9tWvcptz488mEvFBYlAFmbC7qwRW8iJhMrSZUR2ajyWHyS6
	SczKcNyjvEOFhAAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77B0D3EA62;
	Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6DYLHFH+gWlGDwAAD6G6ig
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
Subject: [PATCH v3 09/12] firmware: google: Pack structures for coreboot table entries
Date: Tue,  3 Feb 2026 14:52:28 +0100
Message-ID: <20260203135519.417931-10-tzimmermann@suse.de>
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

Pack the fields in the coreboot table entries. These entries are part of
the coreboot ABI, so they don't follow regular calling conventions. Fields
of type u64 are aligned to boundaries of 4 bytes instead of 8. [1]

So far this has not been a problem. In the future, padding bytes should
be added where explicit alignment is required.

v2:
- use aligned 64-bit type instead of __packed__ attribute (Julius)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L96 # [1]
Suggested-by: Julius Werner <jwerner@chromium.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 include/linux/coreboot.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/coreboot.h b/include/linux/coreboot.h
index 48705b439c6e..5746b99a070d 100644
--- a/include/linux/coreboot.h
+++ b/include/linux/coreboot.h
@@ -12,8 +12,11 @@
 #ifndef _LINUX_COREBOOT_H
 #define _LINUX_COREBOOT_H
 
+#include <linux/compiler_attributes.h>
 #include <linux/types.h>
 
+typedef __aligned(4) u64 cb_u64;
+
 /* List of coreboot entry structures that is used */
 
 #define CB_TAG_FRAMEBUFFER 0x12
@@ -30,7 +33,7 @@ struct lb_cbmem_ref {
 	u32 tag;
 	u32 size;
 
-	u64 cbmem_addr;
+	cb_u64 cbmem_addr;
 };
 
 /* Corresponds to LB_TAG_CBMEM_ENTRY */
@@ -38,7 +41,7 @@ struct lb_cbmem_entry {
 	u32 tag;
 	u32 size;
 
-	u64 address;
+	cb_u64 address;
 	u32 entry_size;
 	u32 id;
 };
@@ -48,7 +51,7 @@ struct lb_framebuffer {
 	u32 tag;
 	u32 size;
 
-	u64 physical_address;
+	cb_u64 physical_address;
 	u32 x_resolution;
 	u32 y_resolution;
 	u32 bytes_per_line;
-- 
2.52.0

