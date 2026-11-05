Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894352;
	b=fxe60VzlJf9uZ7UrR8OhYYT0b+47Jl4HjMHqoGngoYUVh4n3cLo1g5IAjYvnOY4txm1h
	 sUP196wZOo7sThlNAfMnQUYTssE88rixBVIG7Y9NUX+EafwKBdlPuHX0+B4X0cITnS6k4
	 F9fCzvxpbPdaouR1ijHWVg9rH+0zc585ZO5FX+I98TY+Ea8aPbFkYrhms2hqhE6xp63Jw
	 qE9Znt7OqQvlxR1tzS0LIzxyFrm+VQyKIDMYDUTzqyTNrDOlgzzHiKm93jc85/NZIbMjT
	 rF5skL259Xhi3VeR3FdE1xdDQj1AosSgGQTZz3+WbQM3DUH0cTjPj7NDg33D9/cPMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S7QYdpXb8VDeYDOCOQvmGRySrKCk7ngW17iUEjSNiJ0=;
	b=eWG9QlxCNwa8O5pnJ3o33J4nfpXxkAxnbxvJ5HWuPK7UMixMsnUJbhuc1NcIGsUrtsQS
	 NP8aH2d2DbhdAcWyQH/MarM1u7dv+/phLSUnijECd2X0ar9T3I/1apvekA4N/hR1U9WhJ
	 jsMP6KIzTtb5axpuZHu8x5Ma5PvpejHflhY1KwWsh+WQI1XCvn+6asHjIVOvk2ADVrZS9
	 lppUhlc8latqJgRSkAq/8dJZm/lfBbzuNzyIauqUTYU2J2PiWHRBkbwnuwA3hGgQ+FZI+
	 CwKgU1G+U3azOra5+u7aEIZHamCaYtFcK9k+oTeM4YDofauo2udXn/1VuC+LMRAJd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=acv9QQzP;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BBE606A615
	for <chrome-platform@lists.linux.dev>; Thu,  5 Nov 2026 15:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7BBE606A615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=acv9QQzP
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c414e5d282eso273068266b.1
        for <chrome-platform@lists.linux.dev>; Thu, 05 Nov 2026 07:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793894350; x=1794499150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7QYdpXb8VDeYDOCOQvmGRySrKCk7ngW17iUEjSNiJ0=;
        b=acv9QQzP+VTtln3Uw/yVYy80IFAG94T2e8E/TpahvtrFIC5ufAvS9ja3wpUxUl/+a5
         cNPY0dv8uUP4t8dpDxJx2xn4m9rGNzsRIoOfCv+10Xd6vR5kAEkKvOYPtBSh0UiE6h3c
         +QRoCkRlCHMM2FLxgbQ5chFJTuuy9nU90H9HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894350; x=1794499150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7QYdpXb8VDeYDOCOQvmGRySrKCk7ngW17iUEjSNiJ0=;
        b=PYWg/GFl2jlonxWpsT8VAeaqcqist6wWXwxdBnkoOMppz4ErYC8q16ldKB2dCXgnaG
         9+Od7RY9b7nUP7Uo8hGkRote0hTKoZtXejjATpPUOLaevWVT4dz6qUSe81JgYr9YcVB9
         SpM58bBtbrlBScky6B/WHI1klNjcjyg5h2t1J/MuXfPJrSGYLqZey23prjFEabZKXALZ
         CmKV6wKw+OL2rZMX/O042rkV5Wuixb25fD26gIsTuNLdehmmkyOPuOOSw6iTXnOvPs4Y
         SUtlRQrqAoGffCf12yC/IPWlQL85YSTarJNbVdSUlgCtZBfQEao6qnitTm/EHD98Hpui
         0w9g==
X-Forwarded-Encrypted: i=1; AKwUvBzRZVoy/AqBvc2PxY/Ru58Kon71CAQ0DWTrbQ8DD+qGDOJodhCtyuXs+6/2HlhiOo9oFAVsvRO66VDgIbmLS2w=@lists.linux.dev
X-Gm-Message-State: APuU4Z8AgdVoYFunr7Y7ghTIfP+UTJ1XXYXdhjmQacsGf0ab7H1AG33J
	nNqd51CRLtwbsNwXe6po4+HVPxCTmPDmY+kX2Xdbo/WHwrhs4p3bF9hDuJWR7qsE0Q==
X-Gm-Gg: AYBFou1NfM2lnLmXDiCtVyrT5Dsh1kW+zcGosNycme/0vLrdMXOCOTlwVGReFqjIjdP
	D3SbY7Gv1TkuP6jpobtwJeCzF/+lRJOZf6LlStgs8YzDy+NtUUz0Xg8erOhvvkGrVq23TwnzdXX
	NmTaauSynX2yYfmym3a/Dx6bWfCol+yH7PmhR2q+QozfebmJz3vpuVpx3y2Q5Vl9wIPMh0eslcZ
	rrN7JjtFjePcR57lUQVuNoHylCGrojaanoLcNehitt2Vum95x0sW0SoNrz0Kwr7YK7cEOUF/QxW
	Mko0596LyTIRMPpHNzzYCLhx7+/sOGZaBecJwATQSo53K4kreUCczHz8R2j2NGvnMBAhA4ms9oo
	AbgowOb5n8z5d6+zfSuFaClhA+CManGpzq+eeTRhiAkdP8C48G1yGDS68tBT82Ij3HqCZmeiOCR
	BFSADwiZHIsg8/FJmamGlrx6zwh1iqWt55XTCtgHKbKIT5/fPkWaaoOZVWDSOjd+CvSy6gTUV+7
	C1aobQ8qZ77NCnJvWarQ8ZAYLzggqjb8d7AbZ5hCYHEZTjtK7OOlM9El2M5SY6l2u3OTedjCsWH
	ePp7XizPMB/m6PebyUVh005oLTETpsugBOFqIUMPafBBMEZfnpoSoCwUBUf+ad1a1DqMQx+W
X-Received: by 2002:a17:906:c143:b0:c4c:b545:f29d with SMTP id a640c23a62f3a-c4d34ca20demr657966b.36.1793894350065;
        Thu, 05 Nov 2026 07:59:10 -0800 (PST)
Received: from localhost (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c4d0e43ea74sm189017566b.33.2026.11.05.07.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:09 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 0/2] USB Type-C mode selection
Date: Thu,  5 Nov 2026 15:59:04 +0000
Message-ID: <20261105155906.2670094-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces priority-based alternate mode selection
support for cros_ec_typec. 
The base patch series and UCSI support was submitted here:
https://lore.kernel.org/all/20260119131824.2529334-1-akuchynski@chromium.org/

When AP-driven alternate mode selection is active, the driver enforces the
mode_selection bit for each registered Alternate Mode. This blocks
individual altmode drivers from self-activating. Once registration
completes, the driver evaluates USB4 capability. If USB4 is unsupported,
it falls back to priority-based negotiation via typec_mode_selection_start.

Additionally, we swap the registration sequence of the port's alternate
modes. Registering DisplayPort after Thunderbolt correctly ensures DP is
prioritized.

Changes in v4:
- Dropped typec_altmode_state_update() call in cros_typec_altmode.c as
  it is potentially unsafe.
- Added explicit partner usb mode setting via
  'typec_partner_set_usb_mode' upon successful USB4 mux configuration.
- Rebased on top of the latest platform-chrome tree.
Changes in v3:
- Replaced delay/timeout consts with macros.
- Downgraded USB4/mode selection error logs to dev_warn().
- Fixed comment formatting and added comment for DP/TBT order.
Changes in v2:
- Added this cover letter.
- Rebased on top of the latest platform-chrome tree.
- Tested on Redrix with Linux Fedora 7.3.0-rc5+.
v1 Link:
https://lore.kernel.org/all/20260129131928.794768-1-akuchynski@chromium.org/

Andrei Kuchynski (2):
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection
  platform/chrome: cros_ec_typec: Reorder altmode registration

 drivers/platform/chrome/cros_ec_typec.c | 67 +++++++++++++++++++++----
 1 file changed, 56 insertions(+), 11 deletions(-)

-- 
2.56.0.398.g882cbad275-goog

