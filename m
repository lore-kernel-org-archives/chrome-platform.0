Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371DC7C
	for <chrome-platform@lists.linux.dev>; Sat, 22 Oct 2022 00:26:58 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so4440691pjl.3
        for <chrome-platform@lists.linux.dev>; Fri, 21 Oct 2022 17:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4Z56QD1CCvIrKsTPGC6Qon5YPAVLFQEgNwprnuBCtU=;
        b=IPZF1UwW5SxbJ1b7msUq7LVf59sNZJgGc1sqPbAiChtckECPQJhxvjmBVErujKIz1f
         wRwBF9xFJ23gVN/nkBD+IQkvhJ9Yi4ZBFzShxQ1LQ2y8axdBb8HPCDS6+4ocYTv7TyQ3
         iVhuXTGgkqkBh9Q1udfUuAPhGL5GzI18aqGuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4Z56QD1CCvIrKsTPGC6Qon5YPAVLFQEgNwprnuBCtU=;
        b=dFEldY6Kq+KkkR9IkoCFpLQdZAOy0+60S756Cvgl+JvNnKl2Nlh6pAovEThwHTuREr
         9xNhnJEJk3cTXtqHZGWSiz4L2KpX1etA3ENbmMgdp9eEhGD5HR9RHe7TDfu5ENblZ3sG
         IKuIwZSDwcTSQ8iHcxhp4w24KIXnG5z36nD/oEJpAt1139uurJdBEu5ZsAZWxgMjtL28
         HTOnGuiO1odhf9i70AOv5aeOfQCJptXbK85Y5OnDMAAxf7XGEwI9kl0uV1HAEHeGeeC4
         cMisIBRSyLmVx2CJOGQhlLfxuRekgLNsYpqzdcuLRhIx2AS4m8czRN7ETeXxZxvXy6wy
         f64w==
X-Gm-Message-State: ACrzQf2/+BlQVtXNxS164suLPYdcg9c+yDr43Pnz9By1uJXkuy5VG5oY
	p6U+UFt2lFkC6MHyHPK+mTPsvw==
X-Google-Smtp-Source: AMsMyM5AzCeeFB+prG8aiusWOiIWgRdNjNSJMRheaGX5egNg3h+LB0g/E0afhs6BNb0SKiSZMmtoLQ==
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id mp12-20020a17090b190c00b00211ab5635e6mr13788592pjb.159.1666398417659;
        Fri, 21 Oct 2022 17:26:57 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:d6f0:dbbb:c195:162])
        by smtp.gmail.com with UTF8SMTPSA id y8-20020a170902b48800b0018099c9618esm4120291plr.231.2022.10.21.17.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 17:26:57 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tzung-Bi Shih <tzungbi@google.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] MAINTAINERS: Add drivers/firmware/google/ entry
Date: Fri, 21 Oct 2022 17:26:47 -0700
Message-Id: <20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are mostly used for Chrome platforms, so group it in with the same
mailing list, repo, and (one) committer.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Per this conversation:
https://lore.kernel.org/lkml/af9c4bfd-d3fb-1c7a-fb38-0d8bbd507449@roeck-us.net/
Re: [PATCH] firmware: coreboot: Register bus in module init

I guess if this is fine with folks, Tzung-Bi might queue this up?

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e9759eb08c57..ba57ef11c72f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8726,6 +8726,15 @@ S:	Supported
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google
 
+GOOGLE FIRMWARE DRIVERS
+M:	Tzung-Bi Shih <tzungbi@google.com>
+R:	Brian Norris <briannorris@chromium.org>
+R:	Julius Werner <jwerner@chromium.org>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
+F:	drivers/firmware/google/
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.38.0.135.g90850a2211-goog

