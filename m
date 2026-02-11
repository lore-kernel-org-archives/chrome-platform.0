Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A212D877F
	for <chrome-platform@lists.linux.dev>; Wed, 11 Feb 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770831267; cv=none; b=PM63CtZ6htB7m431toD4tV+4vAUZLROgicCJi82ZTfA60+BCBaYjeDgy/ZQLuAz7ijIsF9t0wo7QhSQ4ssVvvL0Cq2JhiVpvN81+CoSB+mQ9QgOEAx5XQE58V7YJSjkyRfLgvL4RA8DjHe7ZXejYtjQBSe7jV+E/jEPEI3XSsHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770831267; c=relaxed/simple;
	bh=igQC/jHG4y7VEiFOv9JesrmP+mSN3/bEbYL/Phfc/RE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WF2q9jEtEeIDqhpoM76qPl7SdJ3+1yWLGF6xWeXu2B1/nk2lLr1lCe/gZAbMXsIF35vnCCpmz/MEFU4HDvAxQt2WxOR6e1E0iX8BKpMqpVq/F9kOfXvj+MwLkqV2bjBoi94Nz76nVIVCtJmiC4NHooqBiydedN7Fojar95sSFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Of9wKRfS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Of9wKRfS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4554053f8f.2
        for <chrome-platform@lists.linux.dev>; Wed, 11 Feb 2026 09:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770831264; x=1771436064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfmoIHB6Dt2sNt6BObzzbr2Nkzxl+C468xBQRKTJnQ4=;
        b=Of9wKRfSIOfBloZdQ+55t9AHMOj1i9knBXZL6EBkWJjLtiwp/YnXIgcNlO/wKPq1cM
         WUuPKTuL9qc4AfOkhek4FeMWikk4o4sGlp667p+A0ND3qTu1kMJeIfGzoCyaFehilQeG
         Kc3WbkIeRYCfev5YCOMXDmoBfbrqkYQ46vbhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770831264; x=1771436064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfmoIHB6Dt2sNt6BObzzbr2Nkzxl+C468xBQRKTJnQ4=;
        b=MdTe2JPNIsmzh1dog2wiHtkeYSBCSusMDO6vM+GL1AEWsv3bWch6/0jOums9YN5kDQ
         vMnRpaKCWgRwkNrDLUZ1xmZAvonuQEMuGCubq2BTOKnPPyEBjPjv9T5hZqgqedCmI2j3
         bmuVKjbmwZUG8ED8sQm85yl8jXB5wMwUnzXYHYk97mQU0e4dUdDYNN/svt2i9VGyknmK
         OVVUcxTk+MMjDMHnN+himNfP0QS4hTvVMzkot+wT09vSi3b9DxVvowySC4m9ekNklNj/
         aFgVDfquSlH7RsugLAxMTzfeCQEGwYLasuHG8jomkponQylIDKVkNb5kdyZBuHA/14Qp
         KwDg==
X-Forwarded-Encrypted: i=1; AJvYcCVWZ9MZqsRvJRvNlEadticEF1i96IBXftJH3zmLMWL1CPGzwZLu2StCGnbE1oNdPnijKhKxIws+k0G6CDNHeow=@lists.linux.dev
X-Gm-Message-State: AOJu0YyM/92OpaLnYdEC7tYXLF212um5k3/gIwe7Jfoz/IGvA4lpti+a
	ulAxkfHITrRCHdqcZ/jpIwHEdbdyzjzT3ajc6S+y83KuJD9d+DSsmOc0s1Wd0xP4AA==
X-Gm-Gg: AZuq6aJQ3vp5hx2OajbNb/f/EX9HM5FAlEXZjxkFq6QPrr5As+7nT42EjHzWpiZPo9x
	ULCsHyN1v9VtwT0NNe8XC1gOvG3wjfIapbM/O8FCGubHKJMuXWJkdT7X4yyyNvOhhzE7LA5W3r5
	qLLgwmQFqxrdsHtO3bhABytZGiPNVikhHPYHlPlGa1NHW9HEquad2xefoIc+eEABXcMlPGqL+3p
	EIvfGcyLa/qN2+3alYr9Qu8Wy8xQXuzKGKfiwg/pgmwq36jRczvl6yPwmIbPUNW/ODm1uwBEbf8
	7v6hFhosGDibzEo6zJ0WuPh9iNtc6XPSepLZv0Ir12NSAEbXxOPm+meSIK4JQA3QpTTDoUVFxlg
	6lfShTLSTH2+/UMelBQQWlN5L79jxoXmX1B2kKWDouuAKXh7vjojgM09V/Mb7O39GUoiJoJelEF
	gkdkh156Fl96Z/SaSavrdgtHJ61Jw=
X-Received: by 2002:a05:6000:2dc2:b0:437:6758:ce83 with SMTP id ffacd0b85a97d-4378aa127b1mr372199f8f.21.1770831264536;
        Wed, 11 Feb 2026 09:34:24 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d50f24sm5885498f8f.14.2026.02.11.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 09:34:24 -0800 (PST)
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
Subject: [PATCH v7 0/2] Input: cros_ec_keyb - add function key support
Date: Wed, 11 Feb 2026 17:34:19 +0000
Message-ID: <20260211173421.1206478-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.53.0.239.g8d8fc8a987-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v6:
  - Fixed a bug where normal key were sending the wrong MSC scancode
  - Added setkeycode handling so fn functionality is recomputed in
    runtime when the keymap is changed

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

Fabio Baltieri (2):
  Input: export input_default_setkeycode
  Input: cros_ec_keyb - add function key support

 drivers/input/input.c                 |   9 +-
 drivers/input/keyboard/cros_ec_keyb.c | 191 +++++++++++++++++++++++---
 include/linux/input.h                 |   4 +
 3 files changed, 185 insertions(+), 19 deletions(-)

-- 
2.53.0.239.g8d8fc8a987-goog

