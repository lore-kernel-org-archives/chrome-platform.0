Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2E73A1A24
	for <chrome-platform@lists.linux.dev>; Tue,  3 Feb 2026 13:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126930; cv=none; b=Q7GUhQ34xnn5w+ikDwVK5+E8QZseh7EGPF6Xa5DlBr48YmbTvZiA4eaCEPJ4uXJ/vOWbbQdraC/VEXb3Z4r3QEYEZ/jLCaivVKaBx8gAYR1edrywe0r8PYBGkR1hnxBPp4oNUSDJOjdlRsAAJLoQLDxpWsAZs6hxQ0vhn2cdSQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126930; c=relaxed/simple;
	bh=YLeUxlBeJgElXJLX7wp+o8DRmtqsMkN8xM1svmyluio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzeaV+8rbALdAuCYBvx993nQE7QAssgW9Rt5XImn7JJuy18tK9XO3WbBk0KqjjaNta8wdJxSReuObW9N9wFpGQYdQxjRQeVH5Ftbwi5Mfeh/ePgoDzv2TDxo26sEncPffxzgxVy/anWx7eyiRTEJNC9PhKJPMq/Pp2BFOAVy//4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NrPfTirG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zo71BySX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NrPfTirG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zo71BySX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NrPfTirG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zo71BySX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NrPfTirG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zo71BySX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A00B5BCC7;
	Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htF/9yUu1SxNVmAtpFlicJxKCA2Dvt4TFGd2S5vpSxE=;
	b=NrPfTirGSpapJvhAySGIdiJ8bhEb2Xe2cMoAzDLqEigkIHW4vY3pBz9adbUrLP0x3nxmbU
	H2HgGbPxcu140kkYLJWMar9sgAfLlZKEB55F/FEWwlCJnQZqWdUF1w56XrhNT72N5P7ZGP
	N5ngGJxLPjX9U0Dk17d5anRvgEQH9qQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htF/9yUu1SxNVmAtpFlicJxKCA2Dvt4TFGd2S5vpSxE=;
	b=Zo71BySXvGsuV0becXE07Ih/DJfzLY5zbRxR5OdzIWCemsQgD50L/GFw8lz3QKfuP6NLpf
	lpKje22lq+Q0cKBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NrPfTirG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Zo71BySX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770126927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htF/9yUu1SxNVmAtpFlicJxKCA2Dvt4TFGd2S5vpSxE=;
	b=NrPfTirGSpapJvhAySGIdiJ8bhEb2Xe2cMoAzDLqEigkIHW4vY3pBz9adbUrLP0x3nxmbU
	H2HgGbPxcu140kkYLJWMar9sgAfLlZKEB55F/FEWwlCJnQZqWdUF1w56XrhNT72N5P7ZGP
	N5ngGJxLPjX9U0Dk17d5anRvgEQH9qQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770126927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=htF/9yUu1SxNVmAtpFlicJxKCA2Dvt4TFGd2S5vpSxE=;
	b=Zo71BySXvGsuV0becXE07Ih/DJfzLY5zbRxR5OdzIWCemsQgD50L/GFw8lz3QKfuP6NLpf
	lpKje22lq+Q0cKBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 066743EA62;
	Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OGNkAE/+gWlGDwAAD6G6ig
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 02/12] firmware: google: framebuffer: Do not mark framebuffer as busy
Date: Tue,  3 Feb 2026 14:52:21 +0100
Message-ID: <20260203135519.417931-3-tzimmermann@suse.de>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	R_RATELIMIT(0.00)[to_ip_from(RLegosg57ubitsp1hzqd38n4uy)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6A00B5BCC7
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Remove the flag IORESOURCE_BUSY flag from coreboot's framebuffer
resource. It prevents simpledrm from successfully requesting the
range for its own use; resulting in errors such as

[    2.775430] simple-framebuffer simple-framebuffer.0: [drm] could not acquire memory region [mem 0x80000000-0x80407fff flags 0x80000200]

As with other uses of simple-framebuffer, the simple-framebuffer
device should only declare it's I/O resources, but not actively use
them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 851b4c14532d ("firmware: coreboot: Add coreboot framebuffer driver")
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev
Cc: <stable@vger.kernel.org> # v4.18+
---
 drivers/firmware/google/framebuffer-coreboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index 4e9177105992..f44183476ed7 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -67,7 +67,7 @@ static int framebuffer_probe(struct coreboot_device *dev)
 		return -ENODEV;
 
 	memset(&res, 0, sizeof(res));
-	res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+	res.flags = IORESOURCE_MEM;
 	res.name = "Coreboot Framebuffer";
 	res.start = fb->physical_address;
 	length = PAGE_ALIGN(fb->y_resolution * fb->bytes_per_line);
-- 
2.52.0

