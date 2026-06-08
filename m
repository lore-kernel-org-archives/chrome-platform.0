Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D023358DA
	for <chrome-platform@lists.linux.dev>; Mon,  8 Jun 2026 21:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953328; cv=none; b=uAqdoN3TeU7UUdJOBCCLjyRmIhDR104kDKrXtcoXOpWmH4429exanB8HO2tNcHMuwC0xfs2/lgYnXzYyHOed3hAMzMAVQ8XwMkkkQhUx2Tn0HXsS/hwacfBBzzybX4M/mCPenZECl/ahoSYHPjt9dyTuRFqvELq+OuS9meJTeIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953328; c=relaxed/simple;
	bh=aWR2UQzIE/IzR/eEmWU3JUKtuYhJTUQMogLSd3rO4GU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pgc48voSP1YpWnziAoZN4gVoLT3DssWj5bQAWno2scMKkfAeqOcuu8WICsyu3X5iXEVezrItaFNrJJZmT3APuK7IyHWzgxjQPwNHLbhOYUdzN+HahiXuBZobZZON9fQ40yoCu5knzdmkQgxni3HUszZ2HotCW4R+gi2hpwMSG4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KDZSoIX9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KDZSoIX9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68d234218bcso9300911a12.2
        for <chrome-platform@lists.linux.dev>; Mon, 08 Jun 2026 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780953324; x=1781558124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liJ0XnvvXc9RDrimRSxouXGvqmG/EtupjrLSMKcFoYQ=;
        b=KDZSoIX9whFX3GqrgiSyMhHZQPgUaZRWQPU+Y4BkSPGldWKkZCHRBvkwe/a9saPuxE
         wstvO4/Kcdv2wXzWKiML2nW9Pf9kDE9R87FBUH8PkpPY6M521UP7Aksy/mxVcD4+gc+N
         /3Mio7hLmQNtbGyiZoCLTya+o3S+Y8ypPvR/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780953324; x=1781558124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liJ0XnvvXc9RDrimRSxouXGvqmG/EtupjrLSMKcFoYQ=;
        b=KjLFSASbWcmfA1GTz/aZ06qmk/MdeVKbuaU0jVJWjWb9YXQbs1CjrwTTVqXvai5u/8
         GStaXoJ5GGyZ4qWG0aaNdYq2TUWsHSUt30TQC1nvCjW81eqp8+eTJ1XwraceIu+f2hn1
         CHoUTYLXkk2j23ehFLwJmil0UNhnj96XmP2rLAiFhKrvzfWUnWvQyT4pmhQ8xYSvaZCC
         yjqxV9bQ8N40WyWti3IWqlHlvP78QwnuIyKH6ovWlNP7i55Oo05b/Xx2MRoTufQ7ekAh
         L0YfrdV6WuvcWinPU1rVtKRni8K4WNNmrPvA2qqdY03IAmR8vgJ2iC56wi/PholEu+Zp
         Zqug==
X-Forwarded-Encrypted: i=1; AFNElJ9zY0hmTb3KmsqHsSTWKSNABTIQHNDsFclDFCXwwVauKfequUxjzSMHPFzLJ9EedCixU7FJFkL4nxJlgOGzEK8=@lists.linux.dev
X-Gm-Message-State: AOJu0YywaTEKfwlp5W/tWp35eiwNX16RdvYE5QOLVVpI4AyUdnD6L7Es
	haq/8/wg+SMTTdNKeKg/eRTL10pjnnUV6hM5nm6WwVOzuRLfP3mmgXoPGH135LuOyA==
X-Gm-Gg: Acq92OGvkJmxEqVp209D9VHszbJ9IfQU2I7L5P2663gNmgUxoCX/gyPRaihW/iPVX0T
	0BEvmUYC7A1XrRZi5+xkRFW4WytHGNP5Nop912vaJuqdGxC0PHSEY6La1B0kS4HWkYg/fBzLb5h
	W6GLpuijmrrsX8A+B96cJejM6u7oiV9krJm/8n3My8ICYillyNquMuNJCY4IMSg6eMBqLwc4Pq+
	BmE/0avVtlIh5fGLzloECngCfK90KbkeEo3naUhmjwM4rtt6KJtVHLWJCmhxN11F6hbI+S2LWq9
	By6XNMjZhwxBC/FI5Mq7TDGdtjd2KFkBG7grRzvM5eIreI8/2wCCgsdonbQbHtP+p1rVuC5/dl7
	qMspaZx+KTiffRjjSuE/QsXGGi6TLOmk8XgNpFkrZy1Zd69meBUAvhR/LM5IyRqZbtkdLj2df2b
	qOxFVrol4nr2voIhEh2kW0FGzAB4zSX2I4G3QxMWHu8Zxuu9keUSMyli10fzqVoMDRVb20Yh7dW
	DwFZbW57cWcTvXVV9iwATvYanzxhX8jS4s+WXMg9A==
X-Received: by 2002:a17:906:f5aa:b0:bec:6c5c:cced with SMTP id a640c23a62f3a-bf372159bf0mr923311066b.28.1780953324448;
        Mon, 08 Jun 2026 14:15:24 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (208.220.32.34.bc.googleusercontent.com. [34.32.220.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517712a7sm931041566b.4.2026.06.08.14.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:15:23 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/2] mfd: platform/chrome: Catch EC feature read errors during probe
Date: Mon,  8 Jun 2026 21:15:16 +0000
Message-ID: <20260608211518.2214740-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a sysfs duplicate name collision that occurs when the
Fingerprint device fails to respond during probe, causing it to
incorrectly fall back to the generic 'cros_ec' name.

Changes in v2:
- Split into a 2-patch series.
- Carried over Acked-by from Tzung-Bi Shih for Patch 1.
- Fixed an ec->class_dev resource leak by utilizing 'goto failed;'.
- Moved class_dev initialization to prevent a missing release()
  callback warning on the error path.

Andrei Kuchynski (2):
  platform/chrome: cros_ec_proto: Introduce cros_ec_read_features helper
  mfd: cros_ec: Read EC features during probe to catch transfer error

 drivers/mfd/cros_ec_dev.c                   | 18 ++++++++-----
 drivers/platform/chrome/cros_ec_proto.c     | 30 +++++++++++++++------
 include/linux/platform_data/cros_ec_proto.h |  2 ++
 3 files changed, 35 insertions(+), 15 deletions(-)

-- 
2.54.0.1032.g2f8565e1d1-goog

