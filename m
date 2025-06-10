Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DF11A23B0
	for <chrome-platform@lists.linux.dev>; Tue, 10 Jun 2025 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569949; cv=none; b=YOSX+zlvXZTlJdfZd5Bodtvh5WKOBTNX+jFfpc0OdqQ7bhejYSysGtqGPpTUBeEFqIyntoQXaY2SOELz8BDjvYmIuoIgPbB5niMcbcWAJt0DKzpG1kYqES5JbfqTe5RwM/+m5NykAbUXInYKIBn3PRswkJihe0aBK/bEyzeDRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569949; c=relaxed/simple;
	bh=X3FMNaH+gMkSWc6mxlddlgItT1JWMkGhMkmmBWRVpzU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=c0J7A8Yd010H1ZOK8C+RmzUCK97bSNkoRP2y3qmP9R/8Sn1+ZZ89+UFUkKm2hASl2arcbPThOd/V8rBdwvuh+LvVe3ble4hGaPaUhcch3JffPnqqliL5e3WCP96PoLgr3mcI/KdYFcrFXs44KtGxO7DSr+jJAGnEdCR6vnGIIZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W9ZTQj/J; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W9ZTQj/J"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6083f613f0eso227264a12.1
        for <chrome-platform@lists.linux.dev>; Tue, 10 Jun 2025 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749569946; x=1750174746; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K83VDCEaogYq8o+q4q2QDKkSbCK5mXjp54sio/cApS0=;
        b=W9ZTQj/JMw2ZgXVfJrNVFAdW8O7k43gE4mwlTLWt/jq/2Ex2tgWPZCfVS8orSfMQ9b
         K4EtQc23fza6FJiicRxlE5quw6yl2DZIERLeUEJDKbnhGJXyjaRzWTxz1m4K1ZnCQuMy
         xw+kU4Si/FCpFI+TsGwUDoHT4gQGlJQ6eozffssT3J40a98zVDXRfKkT0dWvZ6/FH+NG
         4eYC5w7rz0MwVOy647bPoSYCj9Om9QAdhClIsdXnR3x4bLPQfvrCWAEtFLssuulBmjj6
         bNsR10Y3khGUiC3Rl6DhfS0BbZONC0rvF9tl6w0PCaK8Tdo1SxjfOJU5diFPA1JrHc5Y
         WcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569946; x=1750174746;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K83VDCEaogYq8o+q4q2QDKkSbCK5mXjp54sio/cApS0=;
        b=oiszxX3qp2s41+HWp0x9qvjTW2eW3D/K8zP8CuE45uNsg44yHjzNlCO3PZlhQsj1kf
         1mnFolEFBKEyqAn3fYPU6gOrUxaur7CjGOz6CqNpklYlyGT8alstm8IWTfUONQKPdxiL
         v5s0Rhoafi4/mZxgHcrFzkxHC+KRrgC6NoTbkMMi1/q55a8ht13AlX4DfLtS48rRIn74
         R3CbjNb5GljT+TQuPXZyLlUvMk/+WpvEQ4qg/HYV7lysevywwfel4Wpe4R4Av9YFDL6z
         B7vOXsercOsfRuliZDJ4/XEhK8qTVsTt9/G8qht0thFurB954BIaRI2y/Zak9jdFYth0
         6oYw==
X-Forwarded-Encrypted: i=1; AJvYcCUa3zrVBX8ZmPe0OGuxAA9nCtN5eKsn9b0HBSavIwLrqF+jrlYWAf6J1DSsWf04m/7+hj7gvQsx++ORIZzYOvw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwRKQipBsRGkomPImzSLMKxaRPwCVN926lZusWdu5rHLix1YTsr
	1WajCQQDXUqc/wGD3kAsta0+1dEGe/hD9hSNJRdPMvNWY9qsG65oZtn3LGdAhO+VczXZuqinou8
	uv0ng+QSHZu9P/D/Sow==
X-Google-Smtp-Source: AGHT+IF0ZTAD1f0oKGQJq37uOuJo1nDnMzixE4HUDx2a7KPwnJbsLI8iBEKebG9jVNmmils6F028/Z0NOTH4V24=
X-Received: from eddn5.prod.google.com ([2002:a05:6402:5145:b0:607:fd2c:1f11])
 (user=tmichalec job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:254b:b0:607:434d:bc2c with SMTP id 4fb4d7f45d1cf-6082dba7954mr2757439a12.23.1749569946760;
 Tue, 10 Jun 2025 08:39:06 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:37:47 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250610153748.1858519-1-tmichalec@google.com>
Subject: [PATCH] platform/chrome: cros_ec_typec: Defer probe on missing EC parent
From: Tomasz Michalec <tmichalec@google.com>
To: Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Konrad Adamczyk <konrada@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, Tomasz Michalec <tmichalec@google.com>
Content-Type: text/plain; charset="UTF-8"

If cros_typec_probe is called before EC device is registered,
cros_typec_probe will fail. It may happen when cros-ec-typec.ko is
loaded before EC bus layer module (e.g. cros_ec_lpcs.ko,
cros_ec_spi.ko).

Return -EPROBE_DEFER when cros_typec_probe doesn't get EC device, so
the probe function can be called again after EC device is registered.

Signed-off-by: Tomasz Michalec <tmichalec@google.com>
---
 drivers/platform/chrome/cros_ec_typec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..f437b594055c 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -1272,8 +1272,8 @@ static int cros_typec_probe(struct platform_device *pdev)
 
 	typec->ec = dev_get_drvdata(pdev->dev.parent);
 	if (!typec->ec) {
-		dev_err(dev, "couldn't find parent EC device\n");
-		return -ENODEV;
+		dev_warn(dev, "couldn't find parent EC device\n");
+		return -EPROBE_DEFER;
 	}
 
 	platform_set_drvdata(pdev, typec);
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

