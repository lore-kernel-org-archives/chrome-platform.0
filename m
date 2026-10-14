Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08DE499F0F
	for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963801; cv=none; b=qADfT9QVwU9/whYRulVM7cp1lA4O10Gmtfr2d7+kMwySKOmWBJeXuNOpuhSxUyrbBvp2tcOYGFJzfBInJyw6zwf6erRDMapPv3DKqakD/D2ai3+QzuYd6x+xMGNSvW1IfFG1cDBAxxC8MmUzu/xyUCoCUqmbOPce6ZjMnch2sb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963801; c=relaxed/simple;
	bh=RdI1ValVHrckWf+LK4K9qCvOYEsK0Mib4xFgNjovC9U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SUWABWn1qmelheuaQcXc1zdQIcwnKZPyAoCogayEQXZf2uoDE+3rpXvabSfISB97sYLNBrH/cNdXnZwWayFnz4Y6ygAaKbJqyxhfcmvnApZX3vyhdwkkI59/f/08hOTbgHp9r/ZD/r5rBd5P0MmIfST/6ZxQce85gmtRG9aQqIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G2CIgoKL; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G2CIgoKL"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso908756a91.0
        for <chrome-platform@lists.linux.dev>; Wed, 14 Oct 2026 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963792; x=1792568592; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pj+jw3KDNGSk5vFLD/Ng3Wm0Iozh721palMxWZ6QePY=;
        b=G2CIgoKLEuCCvEywE9WCxTJ1m92cX254o+kQ8CEyCEYP+MbGIIl8CnXe8Z6AA3NznG
         WTyG63hEx3zld3JXjti8ESoS5wte9EZ63mLBSWQ+2jM7OR1UwUvYXqcqt9qDcNWb8eoz
         eH5NwtEhufWQtNZQwoF7zrBKQo4ABgWgqcAT7mm9O+XafCPV5U+cef9DC4dxNPQ3YgTz
         IWudwdAb7VZJ6qtU1/hAUQFVbG++C4O+T5SYDEtd+psl12BGBgJlyRRcN1+Ctgq+Ddw6
         JIn+cLNP2CCYC2Ng1lR8zM9EKzAMdeHWbj1FcasKioI2WjUh0GQB0fsxBaFjoCO32Llu
         dDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963792; x=1792568592;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj+jw3KDNGSk5vFLD/Ng3Wm0Iozh721palMxWZ6QePY=;
        b=I3hfzJjruqqsQ0/cxnnDyA9PKb8lBCjBVMuWZJ/9kR9NOuYMVn/H/vwHCLTZC0ujoz
         ZlEnSCB77kzL8EYEzjvJGAwxuWFVPE26M+ZsEW+lJicvv33JtlPfQVH5aVcak6KFemze
         KtBMPkC/6i3G5tEWIgT3fYUYef4OVvO8I+Bt4MkLXdbxKVVDJSIf8FycdRbBmhc9OeAX
         LeCG6NdoiPRzWESRHnfhTeGblP7NxVU5ifmnzTrlG8Q6Ve6XoSk9UlpMvN7TFEGt9YE0
         Bdwg4hKdl/sPGCFBuFMDgLDgKqOAcnThmEKjirRIjXaiGgMNqAwmDTRVAZoQo5uS2MkF
         89PA==
X-Forwarded-Encrypted: i=1; AKwUvBxK6yQLN13rZhJSYOgTInbZCRUKoH282Wnb7Cp7MMed84Uqz7CfiStWvrxzzt+PbwJ6KXYvFwMQ5xlxb3jBJJc=@lists.linux.dev
X-Gm-Message-State: AFq9FYK7tbFCRDBCAry2/JPb7mCODAGA1gocif3GxAnt6RImvrjNWmR5
	3NZK21RvigsUErCGYj7Jl7WMrSw+3rbFFN5ljcNKHmdvqHwEaCHZ9VxE7bqXNpwRzTGT3/PwAE1
	pOfb53i1j3E2FsA==
X-Received: from pgbdp1.prod.google.com ([2002:a05:6a02:f01:b0:cd6:178a:2717])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:314e:b0:3ab:3201:310c with SMTP id 98e67ed59e1d1-3ab3a9aa90amr12744557a91.63.1791963790095;
 Wed, 14 Oct 2026 00:43:10 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:00 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-1-sgsatyam@google.com>
Subject: [PATCH v5 0/6] platform/chrome: cros_ec_sensorhub: Timestamp wrap and
 drift filter fixes
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

This series addresses 32-bit EC timestamp rollover across deep AP
suspend and updates the clock drift estimation and timestamp filtering
logic to prevent Out Of Order (OOO) timestamps and large timestamp gaps
during sensor batching:

1. Account for 32-bit EC hardware timestamp wraps across deep AP suspend
   and restrict overflow adjustments to forward wraps only.
2. Bound the history shift loop start index with min_t() so existing
   entries shift properly without array overrun.
3. Clamp the calculated drift slope (m) within +/- MAX_DRIFT_PPM (5000
   Parts Per Million (PPM)) to accommodate standalone EC clock drift
   while rejecting large interrupt jitter spikes.
4. Reset the timestamp filter history when the time delta (dx) changes
   by more than 10x across Output Data Rate (ODR) or streaming/batching
   mode transitions.
5. Increase TS_HISTORY_BORED_US from 0.5s to 2.0s so normal 1-2s batch
   flush intervals do not repeatedly reset the filter.
6. Rename cros_ec_sensor_ring_check_for_past_timestamp() to
   cros_ec_sensor_ring_is_past_timestamp() and drop strictly past
   samples instead of clamping them to last_ts.

Changes in v5:
- Split the clock drift estimation changes into 5 separate patches and
  include "platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap" in the
  same 6-patch series as requested by Tzung-Bi Shih.
- Squash the MAX_DRIFT_PPM = 5000LL update directly into patch 3/6.
- Drop unrelated whitespace changes in cros_ec_sensorhub.c in patch 1/6.

Satyam Gupta (1):
  platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap

Scott Collyer (5):
  platform/chrome: cros_ec_sensorhub: Fix TS filter history shift index
  platform/chrome: cros_ec_sensorhub: Clamp clock drift slope to
    MAX_DRIFT_PPM
  platform/chrome: cros_ec_sensorhub: Reset TS filter on ODR or mode
    changes
  platform/chrome: cros_ec_sensorhub: Increase TS_HISTORY_BORED_US to 2s
  platform/chrome: cros_ec_sensorhub: Drop sensor samples with past
    timestamps

 drivers/platform/chrome/cros_ec_sensorhub.c   |  37 ++++++-
 .../platform/chrome/cros_ec_sensorhub_ring.c  | 103 ++++++++++++++----
 .../linux/platform_data/cros_ec_sensorhub.h   |   2 +
 3 files changed, 117 insertions(+), 25 deletions(-)

-- 
2.56.0.385.gd3acb90ef8-goog

