Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFD136AFB
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDrDDpOm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cc41afd376so1916035ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556100; x=1700160900; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oc8XKB87wQbvVWG32n2t+Y4HWDVG4F2xfYYjT2VaS4U=;
        b=GDrDDpOmpSMdMJ9EVCjg71cVQ8DKoLTmArm7pGBPc+HxVLIKQuSnOvD4HVKrAjYG4w
         wAPcCjbgcn7w96ZpiwW25Rsp3/A64Bqrc80tMmE5b6IaBtaPkRKNw+9QtcZiVXkZM22w
         AqFP+eP2GxE9a5ReMZhDTC2D5UCHlGeGhw8ohpnBR5YwpWtK3/+I6DPhnZitT6SBtgHb
         LezyZr7ZYSLHtwtQrSuVEMeeoNHur6zxmY6Qeg0N1J7aNpj4qniG3oh8VwB5D+sZ3VKi
         24DBrVNPraCMy5hObH3XnZVVGUQCNRpDrVbj7BijPxI6uO04R2rWT1fkHyUv7Hn6+J3L
         r2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556100; x=1700160900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oc8XKB87wQbvVWG32n2t+Y4HWDVG4F2xfYYjT2VaS4U=;
        b=jzxdBY0PKAE8De2PAXRjTUsonJIjiEO+rSjLthKVffoC6CSNu7l7cp276ZMLEMc2fW
         gs2cODb2q1T8gWLLp/DGMmXck+PW8Y6vKZl9Jsi5uQgjBPSiy1ezekjAWOlXKQyTNdcG
         VC58/7E4QSnTAqUIDLLt3Fw0u3R+UkJaQ2pmukys3pUs8TwsrH4n7XU7992WZCbZzTrV
         6zgalpcRgCg6Inl3AkmkEfiPqhwWfvGwwxydR2/LM4P6Lyv2DfZX/GOE6eLrX+kEmJq1
         iddBK88YuMm0Yk33P9hFjUyyIAaocfNrm98ERsd0HMSD5exIejfTaap1cH0KNAEBIhki
         LL/Q==
X-Gm-Message-State: AOJu0YwFrrgT3WgtlP3FVOfG+cKAltQL27FW/tkXOExuBGhp93DlzoXX
	2ptJOdUCG4toFoktZ6zTtfE=
X-Google-Smtp-Source: AGHT+IEpztjQzljXdJINa8TiA3AV4M8Z9qXo4fdBCG4xuIsFgmcJhHYl+Z7UYu0PyuQnE8wyfFehig==
X-Received: by 2002:a17:903:2281:b0:1cc:2b68:40ec with SMTP id b1-20020a170903228100b001cc2b6840ecmr6475275plh.4.1699556099887;
        Thu, 09 Nov 2023 10:54:59 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:54:59 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/7] platform/chrome: Fix typo 'perod' in comment
Date: Fri, 10 Nov 2023 02:54:34 +0800
Message-Id: <20231109185439.1535962-3-visitorckw@gmail.com>
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

Replace 'porod' with 'period' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 568bbb64a389..ee1c3124d31a 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -701,7 +701,7 @@ cros_ec_sensor_ring_spread_add(struct cros_ec_sensorhub *sensorhub,
  *           last_out -->
  *
  *
- * We spread time for the samples using perod p = (current - TS1)/4.
+ * We spread time for the samples using period p = (current - TS1)/4.
  * between TS1 and TS2: [TS1+p/4, TS1+2p/4, TS1+3p/4, current_timestamp].
  *
  */
-- 
2.25.1

