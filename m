Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266132;
	b=aU+W2ZYiEcKarogdF/4SPbeat6Xpgz3DSR14Zw0GJVvhKeLRcxkJnEEKyHMWWs3iAwrj
	 vWdwzSCoXMrCmFHcBKf+d/VPBKBW8kAKOIm3K6XrrYtOEU9D9UzPSnS0nWP/YbnG+Wofs
	 LkZZuNm2FZewAxcYXyhzLo8aVKtaBQclS9kX/R2l2Y5l86cPjezvejDMsgcqasOgt54LH
	 nPfY0FHl5CM3F4tfv9tJeA4fjhnqlngiQ2pdkSF8wbWEA6KjOTj7pevGzf7MayYYXeiMo
	 RDMQh6nIOy15eGF2Ta4F0biS/9cAeuY92Q31vQHqmORqizI9kp0WGr1tccHrnzYOhDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=b8pOvgJ6ftBD+jWFy+BUMkCeP4sQzdAebnkeUQ4aVeM=;
	b=vHE/OhgnlOcL/8NaQi8Ct10JzXvXsyR1PwlQSlzIdgJlGe0QtslUpIq0jQrey0tpP7Jy
	 MSXgjoELDne7XGh3+6FCKWOWQEsVTJdFyV5k0g7T8QIZ/BmjSKGWqlhHXOZNlWMba8mAW
	 dciwfcsMI5B/03aRs9jxOLWsK7EJl0W8JLn61cVRmTohLz/lePbks/FzchMByRM0i/rdr
	 5qx2v/nT8t735ocVJAfrmoGmTbwypsIL0okdfBl4w265hT7p5Hyqhzjt4bi3LGahKb06q
	 s2T1+YQ2ojAvimsejOsYZgAwU2XCEVIWYamTemWLc/Xd2BQ0MLpTN87vdClFKF7nenA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="qJ9acR/5";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339D606A322
	for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 09:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E339D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qJ9acR/5
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so5645689c88.0
        for <chrome-platform@lists.linux.dev>; Thu, 29 Oct 2026 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266131; x=1793870931; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b8pOvgJ6ftBD+jWFy+BUMkCeP4sQzdAebnkeUQ4aVeM=;
        b=qJ9acR/5GSM2Ljdg54JLDqlzkkQhl3ls402RXbVSVRjYUS9gV+qCo/bgXLAoLPbx/e
         k4mJA6+PlEuaSLWFsA5oA0lLFXnb4vNolYK3xxnc13a+uq2rTcwmkSpMLVLB7XMx2pkH
         /20QAfemLp9ZXC23c5vepuaVERTJCCgSuSUFgejI5JAN67RVbP9rL/Je19lQxz0KPVQv
         U1VtPaKbbWiaQEvl2LTi0FKKluzSmnw4nDOJ0b2W7h4aTPem/cY+OX0UZmiwBB7BuZ8C
         Xab8aXvtVtloEyJtStyqdgVEQBr86YJkI0ASF+TTIRoDVs00xH9hGRCN5iwRvRyA54/L
         OMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266131; x=1793870931;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b8pOvgJ6ftBD+jWFy+BUMkCeP4sQzdAebnkeUQ4aVeM=;
        b=OqEVU47CymTjA77L0iHLbr7K1Sc15a2vEUOcsyX9Kp4EDS8F/7TBW5BsU+DUwlcmia
         55Psxg0gBB94IEv8um9rPSjeMHxJ515cvUByU9XFoiCHrQq2wnE5W6ADBOXnTo3XajBm
         m8CkQMT7iRUjVp2OFLfwym1ELje++UT2hqlaGwnCVpyLkxKsDoS9HMnUnVLLUN13oAFG
         5rRki2AN/UQJuhkbH+618tzphQ9fto9LuhUCIYB4HldfQjE32wbeWviFrOTHS2Dhuzea
         hul2psBTlOpti+mfIeqyn4Xmi0klzN9kgC2/58ZvvVTFx+PArDCE1U+HCk0WZqXBzO5G
         xMkw==
X-Forwarded-Encrypted: i=1; AKwUvBwQoxsqhcxtgN2y2r/eG/Wd/VnFTs0r9jZ7sh3Y8Fmsvm6+KWjqf2+7sVLyixifpXaDlXfnqo2ZivCnNHSnftI=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTL7ZZWq6UCgJu0pCgPhu7qSXQdpy6UrcbC+hIGu3qVZzZ2baf
	E0jsRzNiJzplA5mIIKDmex2AhsHUozg71ypAW7XChomoWPlMf+Og79UI4dxP9KCUsK2Dkd2ddg7
	VTB4K3UdlMKKAwg==
X-Received: from dli6-n1.prod.google.com ([2002:a05:7022:286:10b0:1a7:a0e9:a225])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:42cb:10b0:165:aced:1fde with SMTP id a92af1059eb24-1a6c27a3ba4mr7332206c88.0.1793266130487;
 Thu, 29 Oct 2026 02:28:50 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:39 +0000
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029092846.1567475-1-sgsatyam@google.com>
Subject: [PATCH v6 0/7] platform/chrome: cros_ec_sensorhub: Timestamp wrap and
 drift filter fixes
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

This series fixes how the 32-bit EC timestamps are unwrapped, and
several issues in the filter that converts them to the AP timebase. They
caused sensor timestamps to be off by a whole overflow period (about 71.6
minutes) after long gaps such as suspend, Out Of Order (OOO) timestamps,
and large gaps between sensor samples during batching.

Patches 1 and 2 handle the EC timestamp wrap across long gaps. Patch 3
fixes an off-by-one in the filter history shift. Patches 4 to 6 make the
drift estimate robust to interrupt jitter and to switches between
streaming and batching. Patch 7 drops samples whose timestamp goes
backward instead of re-timing them.

Drift between the AP and the sensor hub, measured from the
cros_ec_sensorhub_timestamp trace event over 10 to 20 minutes:
- Intel ISH (Panther Lake device): about 16 to 21 PPM
- standalone EC (MediaTek-based device): about 2900 PPM

Tested on both devices with the Android CTS sensor tests
(CtsSensorTestCases, 440 tests, all pass), and across a natural wrap of
the 32-bit EC timestamp with sensors running. On the MediaTek-based
device, also tested two 40 minute gaps without FIFO interrupt, longer
than half the wrap period, after streaming the accelerometer at 100 Hz:
with the FIFO interrupt disabled as is done on suspend, and with the
sensors also stopped, as the EC does in suspend, so that samples stayed
in the FIFO across the gap. In both cases the FIFO interrupt timestamp
was unwrapped one period off, patch 2 reset the filter, and the samples
read after the gap got timestamps matching their age, including the 40
minute old ones. Replaying the same traces through the current code
gives timestamps off by up to 71.5 minutes.

Changes in v6:
- Patch 1: rework "Fix AP/EC TS wrap". v5 compensated for missed
  overflows on resume and only detected forward wraps, but the sample
  and interrupt timestamps were still unwrapped separately and could end
  up a period apart, which the forward-only rule never corrected. Derive
  the sample timestamp from the interrupt timestamp instead, which also
  covers samples that stayed in the FIFO during a long suspend.
- Patch 2: new. Reset the filter when the EC and AP elapsed times
  disagree.
- Patch 3: describe the off-by-one precisely and add a Fixes: tag.
- Patch 4: fix the unit mismatch in MAX_M pointed out by Tzung-Bi: the
  slope is in ns per us, so it is 1000 times the unitless drift. With
  the fix, a MAX_DRIFT_PPM of 5000 is really 5000 PPM (v5 clamped at
  5 PPM), which covers the drift measured above.
- Patch 5: drop the unnecessary "m = 0" and use -dx instead of abs(dx)
  so that backward timestamps are not treated as valid intervals.
- Patch 7: reset batch_state[].last_len when dropping a sample, so the
  next batch does not compute its sample period across the gap.
- Rebase on chrome-platform for-next.

v5: https://lore.kernel.org/all/20261014074306.2500909-1-sgsatyam@google.com/
v4: https://lore.kernel.org/all/20261013105753.1370713-1-sgsatyam@google.com/

Satyam Gupta (2):
  platform/chrome: cros_ec_sensorhub: Unwrap sample TS relative to FIFO
    TS
  platform/chrome: cros_ec_sensorhub: Reset TS filter on EC/AP time
    mismatch

Scott Collyer (5):
  platform/chrome: cros_ec_sensorhub: Fix TS filter history shift index
  platform/chrome: cros_ec_sensorhub: Clamp clock drift slope to
    MAX_DRIFT_PPM
  platform/chrome: cros_ec_sensorhub: Reset TS filter on ODR or mode
    changes
  platform/chrome: cros_ec_sensorhub: Increase TS_HISTORY_BORED_US to 2s
  platform/chrome: cros_ec_sensorhub: Drop sensor samples with past
    timestamps

 .../platform/chrome/cros_ec_sensorhub_ring.c  | 114 ++++++++++++++----
 .../linux/platform_data/cros_ec_sensorhub.h   |   2 -
 2 files changed, 93 insertions(+), 23 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog

