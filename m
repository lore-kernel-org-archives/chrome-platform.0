Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E0242D9D
	for <chrome-platform@lists.linux.dev>; Tue, 17 Feb 2026 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343924; cv=none; b=MbKGjFphTy6rit81pfO+lZZsVPHgboHikjwmviJ6FdtofQv49kD+a+DAxxsumSXqVVqBLjxxSV+y+nBPLwtll+3dU0KuNp5Xtjq3IoNym19g067LWouKm7l5K6uulURiOHUjpK4Mcgh3YzrDJfp497OMs/PsujSKZfo56FxWpMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343924; c=relaxed/simple;
	bh=JSihsk7ijLBvTyZTfyIqB7fl7SHphXSpreLsJ9wkvC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uY0386rpMo+mt42c6xk2LZB2ttgRgfwZiVmw35xg1MNpOe78CFLbM+CimXqKGYWpHWSleYcQVm88hX3SCH1ihsRvPh1q65do3b4Scq1FD2/dN8ZbtF8KMh2+ptwi8UCfvMo3tjQh0ZMD0wqGt4NFZjlQc9/9Z25g5Pt4HdtcqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lZNPcLRW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yyv0wogw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lZNPcLRW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yyv0wogw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lZNPcLRW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yyv0wogw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lZNPcLRW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yyv0wogw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 040123E7BE;
	Tue, 17 Feb 2026 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Dv6bhu/RyBxL2ZoHsQ49G4w86dvs557o9ltrUi3TGVg=;
	b=lZNPcLRW1gj7V36CMDDh5C7tPddzHqZzG13zSMcnXrPtxRIh/csv7bLW47Hm4AaJBCTGXs
	ydxqT9FZFk+WtABHQFlcTs1nTICLs7WFdFbmPgXTrww5/1Lzm9S0VgQ1zgQ8cx47+5TKAb
	YriLfpo4hh5hNjWPusVct+1n/JoZKTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Dv6bhu/RyBxL2ZoHsQ49G4w86dvs557o9ltrUi3TGVg=;
	b=yyv0wogwPQdZAK/pVQCvLvaozAJUk/p0ZQ90TH95v9maIaFSrrIinvC2B17IyIDXS/io90
	beEWl+97mAgQ4OCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lZNPcLRW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yyv0wogw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771343921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Dv6bhu/RyBxL2ZoHsQ49G4w86dvs557o9ltrUi3TGVg=;
	b=lZNPcLRW1gj7V36CMDDh5C7tPddzHqZzG13zSMcnXrPtxRIh/csv7bLW47Hm4AaJBCTGXs
	ydxqT9FZFk+WtABHQFlcTs1nTICLs7WFdFbmPgXTrww5/1Lzm9S0VgQ1zgQ8cx47+5TKAb
	YriLfpo4hh5hNjWPusVct+1n/JoZKTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771343921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Dv6bhu/RyBxL2ZoHsQ49G4w86dvs557o9ltrUi3TGVg=;
	b=yyv0wogwPQdZAK/pVQCvLvaozAJUk/p0ZQ90TH95v9maIaFSrrIinvC2B17IyIDXS/io90
	beEWl+97mAgQ4OCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94C623EA66;
	Tue, 17 Feb 2026 15:58:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8m4aIzCQlGk9PgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:40 +0000
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
Subject: [PATCH v4 00/12] drm, coreboot: Add DRM coreboot driver
Date: Tue, 17 Feb 2026 16:56:10 +0100
Message-ID: <20260217155836.96267-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
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
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Queue-Id: 040123E7BE
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

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

v4:
- sort include statements
- remove changelog from commit description in coreboot patch #9
v3:
- avoid packed types for coreboot headers
- comment in various places
- fix typos
v2:
- keep design of coreboot framebuffer code intact
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
  drm/sysfb: corebootdrm: Support panel orientation

 MAINTAINERS                                   |   1 +
 drivers/firmware/google/Kconfig               |   5 +-
 drivers/firmware/google/cbmem.c               |   1 +
 drivers/firmware/google/coreboot_table.c      |  13 +-
 drivers/firmware/google/coreboot_table.h      |  59 +--
 .../firmware/google/framebuffer-coreboot.c    | 126 +++--
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
 include/linux/coreboot.h                      |  90 ++++
 17 files changed, 702 insertions(+), 124 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/corebootdrm.c
 create mode 100644 include/linux/coreboot.h


base-commit: 0082025812a31eda451fb14f13f52683ed375c49
-- 
2.52.0

