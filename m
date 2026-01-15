Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A8330676
	for <chrome-platform@lists.linux.dev>; Thu, 15 Jan 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465295; cv=none; b=qU7nxHHD7ZwFFtz4TJUHKEDA+vXl2fcZLfMiFfFmQSAoiq5XmZEHWafsM+LSrD4q+HHpHX1qEHD2j73YPEXh0x5cHq9diI/7wsrl0tw533e1Qvsy2nANx6rt4M8Aqad0mob8pkc8IzVzbLPhcSD2sKDCWaLFnNqsW2HfnmFTjXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465295; c=relaxed/simple;
	bh=QVJsb6SXXXyVASiBonl/1z0jg4alrwMcJ0C/BjaH96A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJQZDiDlrtKX31Aio+Sj5wrb2CcRtw3xOc8dJBxam5p1AW6p3mcgFE4gvLzuahxrZf0dDU++zPx5VFFufXW5J45Furre/5JfFoRE4TJs001epOVyI8cJsCYpL9Ktn3aValaBnaEsQaAFigjCJRTAPCAxjuNFVyuJSPYrQwvTV5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zeQZjWMG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HY/1CnAc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zeQZjWMG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HY/1CnAc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zeQZjWMG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HY/1CnAc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zeQZjWMG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HY/1CnAc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F3B6133694;
	Thu, 15 Jan 2026 08:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
	b=zeQZjWMG4OH5/A8CVCG8FKhLjeL9coqM/Vls5LnmItpN+qqzFqQpjMJxdo1MoNDE5WbvVw
	sQaWpPx/75R6XfEiDaEtwfQ/1VEDSLjY0Qrk2/LYp/IjUOlu3mrsXsCGYtSEM5yb77JvAk
	BoAzJE2d4LZmm6Ihrnig4QEnj2WkuuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
	b=HY/1CnAcR8HMUf2REUZXRONqbtJnjyL7lspXKg+1Ax2xoE0m/cmDkWzcbCGoax1hm2xYLr
	qBQJL61fyuElBJAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zeQZjWMG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="HY/1CnAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768465292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
	b=zeQZjWMG4OH5/A8CVCG8FKhLjeL9coqM/Vls5LnmItpN+qqzFqQpjMJxdo1MoNDE5WbvVw
	sQaWpPx/75R6XfEiDaEtwfQ/1VEDSLjY0Qrk2/LYp/IjUOlu3mrsXsCGYtSEM5yb77JvAk
	BoAzJE2d4LZmm6Ihrnig4QEnj2WkuuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768465292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=B73bsXW/dn42L/xmLYY7VT5BOiWns8UULJCcXEDPK6M=;
	b=HY/1CnAcR8HMUf2REUZXRONqbtJnjyL7lspXKg+1Ax2xoE0m/cmDkWzcbCGoax1hm2xYLr
	qBQJL61fyuElBJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A145E3EA63;
	Thu, 15 Jan 2026 08:21:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F2IvJoujaGkjBQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 15 Jan 2026 08:21:31 +0000
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
Subject: [PATCH v2 00/12] drm, coreboot: Add DRM coreboot driver
Date: Thu, 15 Jan 2026 08:57:10 +0100
Message-ID: <20260115082128.12460-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: F3B6133694
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Coreboot implements framebuffer support via simple-framebuffer. Provide a
dedicated DRM driver. Keep the simple-framebuffer code for now.

For each firmware's provided framebuffer, we prefer a dedicated DRM driver
tailored towards the platform's feature set. The coreboot framebuffer
device currently creates a simple-framebuffer device for the provided
framebuffer aperture. But simple-framebuffer is for DeviceTree nodes; not
for coreboot. The simple-framebuffer infrastructure should be phased out
for non-DT use cases. Coreboot is one of the final users of the code
(besides n64).

Patches 1 to 5 start by fixing problems in the coreboot framebuffer
implementation. There is a possible dangling pointer, the memory is
marked as busy, the device hierarchy is incorrect, and a few minor things.

Patches 6 to 9 prepare the coreboot support for use by external drivers.
Specifically, structures for the entries os the coreboot payload table
have to be exported.

Patches 10 to 12 add corebootdrm, a DRM driver for the new
coreboot-framebuffer platform device. Corebootdrm follows the pattern
established by similar drivers. It also uses the same sysfb helpers. It
is therefore fairly small. With patch 11, it has feature parity with
simpledrm on the old simple-framebuffer. Patch 12 adds support for panel-
orientation flags that coreboot makes available.

Tested on an HP Chromebook with MrChromebox 4.16. Runs with Weston and
fbcon. Xorg requires an additional patch available at [1].

v2:
- keep design of coreboot framebuffer code intact (Julius)
- fix bugs in the coreboot framebuffer code
- rewrite corebootdrm as platform device
- support panel orientation

[1] https://gitlab.freedesktop.org/tzimmermann/xserver/-/commit/0b326aad28549762ed2b0e2bedf8f8a42f1f6b3b

Thomas Zimmermann (12):
  firmware: google: framebuffer: Do not unregister platform device
  firmware: google: framebuffer: Do not mark framebuffer as busy
  firmware: google: framebuffer: Init memory resource with helper macro
  firmware: google: framebuffer: Tie platform device to PCI hardware
  firmware: google: framebuffer: Fix dependencies
  firmware: google: Init coreboot bus with subsys_initcall()
  firmware: google: Clean up include statements in coreboot_table.h
  firmware: google: Export coreboot table entries
  firmware: google: Pack structures for coreboot table entries
  drm/sysfb: Generalize pixel-format matching
  drm/sysfb: corebootdrm: Add DRM driver for coreboot framebuffers
  drm/corebotdrm: Support panel orientation

 MAINTAINERS                                   |   1 +
 drivers/firmware/google/Kconfig               |   5 +-
 drivers/firmware/google/cbmem.c               |   1 +
 drivers/firmware/google/coreboot_table.c      |  13 +-
 drivers/firmware/google/coreboot_table.h      |  59 +--
 .../firmware/google/framebuffer-coreboot.c    | 122 +++--
 drivers/firmware/google/memconsole-coreboot.c |   1 +
 drivers/firmware/google/vpd.c                 |   1 +
 drivers/gpu/drm/sysfb/Kconfig                 |  16 +
 drivers/gpu/drm/sysfb/Makefile                |   1 +
 drivers/gpu/drm/sysfb/corebootdrm.c           | 434 ++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb.c             |  24 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   8 +-
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c |  30 --
 drivers/gpu/drm/sysfb/efidrm.c                |   8 +-
 drivers/gpu/drm/sysfb/vesadrm.c               |   8 +-
 include/linux/coreboot.h                      |  80 ++++
 17 files changed, 689 insertions(+), 123 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c
 create mode 100644 include/linux/coreboot.h


base-commit: d5b0278e4bea2fb27de6d12b7f865a74072af677
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
prerequisite-patch-id: 719d09751d38f5da743beed6266585ee063e1e29
-- 
2.52.0

