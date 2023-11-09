Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AE36AE6
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMk++PBt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6bbfb8f7ac4so292114b3a.0
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556096; x=1700160896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOp+xpHlmwwJHpuAsntREKGWWkLs/V8YPmUbdNBBy0c=;
        b=aMk++PBtX5LP0TEowDxrdHmsR87MRXiQpQ0vBnoydrehWiWr7bYzatICNF6UlIXI8i
         rWHZWT8DdrpneutOsAQQxprxjur3Y3CHri9or8cre1NITxBMmAjJZysVPVEGVkiSHnrr
         2OxUqHCSiEVCg90MqdyGxGQWNmX06M6CsL5y3RNbOlbjJNpR70Lm7egeN49ll07H4scU
         PEtDakpELoZUNJ5AyOZkoDvK6U0hhbWMDLVC7lm/AH97HYid08pnu0d8xEugcEy37kRt
         DDKGeES/BDnkr4/vzV543P+0KISzNSN0n547wVWFb2lmWLakNAB7nhzzKQf8DxI5HQ4u
         MdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556096; x=1700160896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOp+xpHlmwwJHpuAsntREKGWWkLs/V8YPmUbdNBBy0c=;
        b=okWsZ1Q1ywcN0v2ovKZs0zLTGkTpeTIGXw/g0QRSehcGe1YKYj6rTNBv8toEAhhKMP
         NeQT1XH/bkzwaJ5Ew7AzSQUOLT0ZUCcHUV1qnqIPsGj/JTi4wdKwdli6MR0bUyojtzxb
         mw8Z92o4GTfWWqz7+x97dezwA0Xh/UjJmJmBLPQQrp62AmQ6YbAeIgLWwQP3LtbGoBSr
         J3nC/bumKdjjTR5JTa3flYt8s4e5T+OdimidCuz2V+0NosFgBsCUSB/TJqbtvKPLDoY6
         PH7NcT3xGh9njEkGWmx8ueaffkywC/0O0tbfJyuHAlw8nqSl8lez1k1VUlgbQ+g5HxPH
         oyUg==
X-Gm-Message-State: AOJu0Ywr0v6UJPq6zEQ+4jUgDMiFC6oaG2ET3O0lkork6ixPOeCWSE2B
	5icjAPU+sdwTa6duQknh9+E=
X-Google-Smtp-Source: AGHT+IE+IJZS1sqYktLsiPaL1df4ka4ANEDD9qXqEAzn3MA5xqXj0C0RPxKP+lsVDxfLH5oDuT8zSg==
X-Received: by 2002:a05:6a20:4304:b0:16e:26fd:7c02 with SMTP id h4-20020a056a20430400b0016e26fd7c02mr6287408pzk.2.1699556096014;
        Thu, 09 Nov 2023 10:54:56 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:54:55 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 1/7] platform/chrome: Fix typo 'preceeds' in comment
Date: Fri, 10 Nov 2023 02:54:33 +0800
Message-Id: <20231109185439.1535962-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231109185439.1535962-1-visitorckw@gmail.com>
References: <20231109185439.1535962-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'preceeds' with 'precedes' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 71948dade0e2..568bbb64a389 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -511,7 +511,7 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
  *                                 ringbuffer.
  *
  * This is the new spreading code, assumes every sample's timestamp
- * preceeds the sample. Run if tight_timestamps == true.
+ * precedes the sample. Run if tight_timestamps == true.
  *
  * Sometimes the EC receives only one interrupt (hence timestamp) for
  * a batch of samples. Only the first sample will have the correct
-- 
2.25.1

