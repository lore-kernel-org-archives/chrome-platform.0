Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E8211A1E
	for <chrome-platform@lists.linux.dev>; Thu, 12 Dec 2024 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005476; cv=none; b=RpRqCBy9Kgvp3GNKsHCLaVd7gTBJj0xfwMn5JV8BjwrNZJnO2f6MrHug0Qz/DPLkjbG2MkayuIfi5eMpqb5nytw4qVtuTlb88a09bMinqlZNTlz6ZxySvL4C3BF7wndjPa47M2T37t5yaR7b47fLK5Y02bL8SkZh4V7o08A8eKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005476; c=relaxed/simple;
	bh=zcbELSpkNbPADO4bWdCMabNQ/G3qr8N+Zs56TfZUQmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JHqPk298w2OfHjQykEU6pAxqf/L30ruDWggYQBIlpWgI8t9K7pFuxQUit4QaYzLcH9dCLW9w3K8PVeSc+1mMp9v7fIWWE1r7CA96Pox1tnQQhFbjN3fTRQ2XzBersSQgu8e93RSli+93Oo/u0hI1b/4nXJ+VktIZyAmHIA2Bzz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Mdy4BtEW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Mdy4BtEW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725abf74334so404904b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 12 Dec 2024 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734005473; x=1734610273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Kt1dBd9tzbwEFbZQF/J5QZap/tCRkDClNmmFyMj4h0=;
        b=Mdy4BtEW1Qgb76rPELejsPazUpbI8pkrJ0qPwsAsxP4XFKuiX2tcuvlatpoQ6HcWU2
         TdUG+g+xtUDpiv+8lAIWeadYvl5+7MWLK6BqbUR2MAOyhH9qKqDWvQoyTWsrkCBVM6Vr
         etxxIcwkdpgFVBSR95fbQ3vbjv6bQEhLBXAksTu9b2zI/72yOzQH7ddfmmcGXCNYRH5o
         J7hdbAt9AYJO2MC/rsX4SSp+zF6lE4c3q+FkHYbwFxyqCCRM/H8OWSlocFWV5i/DgjfE
         HozThflQFQ4wJXVjMUXeNyNtglFAJcAm+cYRMDc8LzDpFOeXPdENZEpii+9C1TyZGucW
         Vpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734005473; x=1734610273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Kt1dBd9tzbwEFbZQF/J5QZap/tCRkDClNmmFyMj4h0=;
        b=Ld326FYEcyLQNVHf1GSgFnJch6/WovU+QwxZni+x5uHn22vhufqavf1XQn9Tc1jBVx
         +QCtl5JfoU+za3V42iLj5aqT6lV17BrhMHTodahVNQUNxkSFCUmD/6cYXVPRRzRTRxgX
         c4JhCkA/Svz6NIRprSYBOW2sT9p1w8WLMSIu/m7TZ9dVaGmN4TEu4k2cbirgh4rFTHiN
         Bo98R7AP9wJo7Hc4AnzEFrO8I4jGRINmlIgxh+GfjOL++gWdQXZ3MYjo43jvUb5p3TEc
         NzVHBuHrV8Rcgxx0TlOScLOws0bulEoSL3uOYKFvganYYUr7ZiGH070CGCXxKA4VME8q
         GGvw==
X-Forwarded-Encrypted: i=1; AJvYcCXYqsVaKC9ukxiJQeBsxfqbqwni2Zla8dk9SNz/lSQ/G4/rrpryyhjHHHJ1pRZafL5o0SZg+rTewfbLZo6EOTE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ9dgeCjZIk7mF+p0xP5qDU4TwUCYUi9sBN+uMA+EAcuPtv8Mi
	i6ppT5epRkEIp7w09d8iZnbzK1Wp706BKjwMqN+UHmDXbBo6aS6w/Qf+ASoj8YI=
X-Gm-Gg: ASbGnctHDqiiuPLFBOuSWep2vMULu8PIH4TfVj1LdFmXWqNy7MooViZ0VzRRt8z61UP
	Vpfy1Ajimk4Ty8em1LEF5EipRRwJmDnnNLCm+6KQcCEyjVfeDk9SRvUKuef513BV52uI+B8V4Qq
	b39TI0PsGJwWHPsZ5i7XzcOCJNemToS2nXO3ntxWj5Dk0TLXw+k3vlP8dG8KVpPQf+Izu2NgPju
	Qlx56z1/2PWSTrfC6Z1uAykTp6SxZOnBnD4HdViUxzwR7VqNAo2XPRnOg9amwaY2KEea1dHDb5f
	I3zM
X-Google-Smtp-Source: AGHT+IEg57HPSz6PBiagBeC1thIpaBi1Aia/aWRV3PYT0qflShVp1kto0KyeDc+hWIyxmzbANM4RSA==
X-Received: by 2002:a05:6a00:430c:b0:728:ac38:4bee with SMTP id d2e1a72fcca58-729069568c0mr104595b3a.2.1734005473133;
        Thu, 12 Dec 2024 04:11:13 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:39c0:3a00:b741:6a01:f624:e219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-728e1f67ad1sm4574683b3a.76.2024.12.12.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 04:11:12 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: alexandre.belloni@bootlin.com,
	bleung@chromium.org,
	groeck@chromium.org
Cc: linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] rtc: cros-ec: disable wakeup in the error path of .probe()
Date: Thu, 12 Dec 2024 21:11:07 +0900
Message-Id: <20241212121107.3903967-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Current code leaves the device's wakeup enabled in the error path of
.probe(), which results in a memory leak. Fix it by calling
devm_add_action_or_reset() with a callback which calls
device_init_wakeup(dev, false).

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 6f2a71a31afd ("rtc: cros-ec: add cros-ec-rtc driver.")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/rtc/rtc-cros-ec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-cros-ec.c b/drivers/rtc/rtc-cros-ec.c
index 60a48c3ba3ca..4cd6eab0fd8c 100644
--- a/drivers/rtc/rtc-cros-ec.c
+++ b/drivers/rtc/rtc-cros-ec.c
@@ -314,6 +314,13 @@ static int cros_ec_rtc_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(cros_ec_rtc_pm_ops, cros_ec_rtc_suspend,
 			 cros_ec_rtc_resume);
 
+static void cros_ec_disable_wakeup(void *data)
+{
+	struct device *dev = data;
+
+	device_init_wakeup(dev, false);
+}
+
 static int cros_ec_rtc_probe(struct platform_device *pdev)
 {
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
@@ -343,6 +350,11 @@ static int cros_ec_rtc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, cros_ec_disable_wakeup,
+				       &pdev->dev);
+	if (ret)
+		return ret;
+
 	cros_ec_rtc->rtc = devm_rtc_allocate_device(&pdev->dev);
 	if (IS_ERR(cros_ec_rtc->rtc))
 		return PTR_ERR(cros_ec_rtc->rtc);
-- 
2.34.1

