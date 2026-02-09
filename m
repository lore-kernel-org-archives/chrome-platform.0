Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E49284898
	for <chrome-platform@lists.linux.dev>; Mon,  9 Feb 2026 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652292; cv=none; b=jM1R6OmEodMDLlIKsoKUH+YKGzn2hmsQqcf5GeD5529XEimiim3sTzPbxW5jcFzJnGT0ZNQQhi7Ch8/WZ2l2MKbahelarHMHg80B00PNZfuEb1KvFzDDkmk1SA6x029LYwA8PeVgbY6j2Z2f2KPJtVtu0hD2o7u3+ty7gpqDzFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652292; c=relaxed/simple;
	bh=Nuidy4VcouerookqpJUzkL+AcBPLi7r0bsVBDY2jq9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOqVaUV7wzdXf3RMPUj82b83DfDGO4vaq1masLlIJgLxbaEGXMnPL3KZY06JPOab25WGhY61WmrXZ1ZEpM0C5TUPBdN8i1KBPjmtKfiyoKc2Eyo2hBn6KNRqScyGQ4D+4N8JLj/F9wvZBWKIQ0j49lGLRs4IPeGs7UG4/oSG4Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I3Z79ibI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I3Z79ibI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso28695765e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 09 Feb 2026 07:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770652290; x=1771257090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+gUdmUa3DqKK9a1+H8JL/5YG5QXo3Jj2RgucNl4lfE=;
        b=I3Z79ibIDN1NHt0SU8iQ51+r9BWwecR2WdtbzuqRtyjF7qvpIvvk5bGo4tc0uim7du
         FKK/bcsgM276dtUYdDo6VjGuAk1jk9nkisgsiiTjDQzC7sEy7Bq2fe3rPGoaffD1T+CZ
         SJC2s+1dFK5ZBbRRcMMwXqkuye+Q5fy7RtB/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770652290; x=1771257090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+gUdmUa3DqKK9a1+H8JL/5YG5QXo3Jj2RgucNl4lfE=;
        b=RNvP+C6SaFOB8aAomy4IfoHlMJGHpth2Mci0TjyrtNJ5XU2gAB3M3PzSXWO5HgY7ZO
         orwroHw/ag5+YrVGO8nx4p/un0a5VFnuouvIsVTErjoL6KoPAazbQP9cLtASB+qKUVp4
         TqIBIxfZUqZGZZbz+IyN1S78luZwZEfQMb3ReUaszp/81zaLLlSyA/AXvBwUEMz/FWH3
         F5FCVXw9V+byG/GU73yyFM9+8fmg9kB8RPh8QgRy8inE5Z8KnCAr2EYqUG2SbJuoBCNg
         jLh/84dCbmS+uPV0hkG04LLGg+MFnnsasvM2Qoi9RWnj9OKIr5WMHE93MYn6p0fltyTK
         6/4g==
X-Forwarded-Encrypted: i=1; AJvYcCXaWY/13tV5tDy/71Ym8s7q0QcJrVFQVZJiYBv/cGC71F5i4tf/JNIAT2jgMEJhyCOJuRwdIthmrpKRl7Y49JE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjx8hJtYHtOSKfm1H/GgR0SyVYvMbu6sJbsqoATb+SFwVlH1Gh
	SeQNn239JsT3sTUMwAtcB/48CFOaikQUwyutnwEWcMLTHWFdwupEkEIYVdOa5FFxErLhtQYMfQt
	gxxg=
X-Gm-Gg: AZuq6aLGUT4zv14E4tHVZeKAx1DAUBn3kC9ZGEPWsQcChiPDQJywjdhPm/n2RugTauM
	wsD/QlJenzPmyXSlDUrb14OzBnTtGvh9Kh3MO1pTw8sQRwZTs7e3qUPHsFLvmL21vtkwfXY9y6O
	K7x9dTKjhIQKscS5ormsksF3uFiQ8PXIb2BmRqTN+mU5Cp9LTxyUmcF5cWhyMAOkMj3dIYkxKPp
	FhrZsRJ16LFXxNG5b8TChgwH4RPxNpzeFwz+2WgCufrl9QVkLsU/nTLFcsGYTI/y0sJgVaCeZjK
	HCelbNfsy+iTNAi7m4UzpQR+Lz6M7oUPuJjE9cZCmbBQXYkdiF2HmdZWrpHk0IH9+bTf5ReCvsa
	jLIWplHKq7QhriTjmr2/XYykkEy5RscEasckVpCn7kxTTEIMlVlFWJtVPz7wDLi4CZqZM/qebEx
	mW+Iy7Lo8grqyHcJLpRTPwXi8vrQ==
X-Received: by 2002:a05:600c:6209:b0:480:690e:f14a with SMTP id 5b1f17b1804b1-483201ee840mr162312885e9.14.1770652290202;
        Mon, 09 Feb 2026 07:51:30 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d7a924sm501929835e9.10.2026.02.09.07.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:51:29 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/1] Input: cros_ec_keyb - add function key support
Date: Mon,  9 Feb 2026 15:51:26 +0000
Message-ID: <20260209155127.158813-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v5:
  - minor renames/cosmetic changes
  - dropped the *_key_status array, tracking using the idev->key bitmask

Changes from v4:
  - just a comment tweak

Changes from v3:
  - implemented fn layer runtime detection
  - tweaked cros_ec_keyb_fn_code to return back the correct position
    code

Changes from v2:
  - renamed the dt property to use-fn-map, dropped the example
  - added few function comments
  - added a helper for obtaining the fn code
  - reordered, dt patch first

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one

Fabio Baltieri (1):
  Input: cros_ec_keyb - add function key support

 drivers/input/keyboard/cros_ec_keyb.c | 167 +++++++++++++++++++++++---
 1 file changed, 151 insertions(+), 16 deletions(-)

-- 
2.53.0.rc2.204.g2597b5adb4-goog

