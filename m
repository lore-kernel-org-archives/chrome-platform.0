Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012C2DF138
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343936; cv=none; b=epajaaB4oFWKUj/bNGxPr8wQRh3clcMxYfHy5/JZQg31PRDquYhLATg6MwcjObmX8H9lNRy2sfD1ohZM7eWB53tPg8Msl/kAnVB2apaJF+GJXTqwpHSzzUgtw84Qr0ePDJgB5aPwuQGJ2B3B6nXLeeUh3kzMVLWscPyK1DScooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343936; c=relaxed/simple;
	bh=MnluHR0fRW3ZtcgQ8/YuacBMC7Q6exaeT65sDVeD14c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icjNd3b8pZSMwzlC2SqzjnzgyEVxEPAd9E5WGjsNhX99cDmEILHVrhOmNHfl1P/rprjUh5fxFUvrgJtXaVzc+RS2TyUXd66YPPTHmfJHuEkVKwgmihF5FjsERkreEtqb33/KcoqrAgB8uNw4sRSzPT5q7PKLe/19G0NpBek6/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MEFLu5Fe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tro5KYVc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MEFLu5Fe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Tro5KYVc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MEFLu5Fe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tro5KYVc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MEFLu5Fe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Tro5KYVc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 85DFE5BD20;
	Tue, 17 Feb 2026 15:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pC22VpTiKDecdhxtcyE9s6EZEjmGT3RKDB+3xuHCSY=;
	b=MEFLu5FechkChmMyyYClx1530+Hx06zU41lCnMQWSEe7iEyPsZyneRy+MC0Xa5dwaos6CV
	BpbP4RmfJCiccknIWV+ixkMVaE/gedWG0fqwNRi0s/dU99AxbLMMLpG6WSJ5JimtMcl2/4
	XC1lxkE4MmjaVZNXiCjm6e75GEgSq/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pC22VpTiKDecdhxtcyE9s6EZEjmGT3RKDB+3xuHCSY=;
	b=Tro5KYVco8KIIwP9+/r06B/UorPQRWWQLYekOXByhrZQe5ucwaZuGuAID4J4DxiTby5XyR
	LgWqqXwJEyxAceAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pC22VpTiKDecdhxtcyE9s6EZEjmGT3RKDB+3xuHCSY=;
	b=MEFLu5FechkChmMyyYClx1530+Hx06zU41lCnMQWSEe7iEyPsZyneRy+MC0Xa5dwaos6CV
	BpbP4RmfJCiccknIWV+ixkMVaE/gedWG0fqwNRi0s/dU99AxbLMMLpG6WSJ5JimtMcl2/4
	XC1lxkE4MmjaVZNXiCjm6e75GEgSq/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343924;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7pC22VpTiKDecdhxtcyE9s6EZEjmGT3RKDB+3xuHCSY=;
	b=Tro5KYVco8KIIwP9+/r06B/UorPQRWWQLYekOXByhrZQe5ucwaZuGuAID4J4DxiTby5XyR
	LgWqqXwJEyxAceAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 253213EA65;
	Tue, 17 Feb 2026 15:58:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gLenBzSQlGk9PgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:44 +0000
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
Subject: [PATCH v4 09/12] firmware: google: Pack structures for coreboot table entries
Date: Tue, 17 Feb 2026 16:56:19 +0100
Message-ID: <20260217155836.96267-10-tzimmermann@suse.de>
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

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L96 # [1]
Suggested-by: Julius Werner <jwerner@chromium.org>
Acked-by: Julius Werner <jwerner@chromium.org>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v2:
- use aligned 64-bit type instead of __packed__ attribute (Julius)
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

