Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35028524D
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bryYdOoZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cc28719cb0so2562765ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556110; x=1700160910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g73QTqa4YTCeJuDnfMTOW8eVS9xm1gIdRDmG7TjF/yc=;
        b=bryYdOoZhDQfitMYO51PaxD7XtCDovgL8QFyvc99srVCpnycFfsfwf3GXtyDU3riFn
         yxJd6gM7XwuWJO+IDUdCKWSbcrqVPJmsLmSdDXG8Jt+e9jgk7dBagsq/L1v6G1nKAyR4
         kGFzrQmKFeOnt/aCEjsdkCUlGBzMYykbSsrpBjN3vtrLwfr+bodMEy3qhyAiK5yHUnoQ
         RrsoTLv4WTP9rsV7PTU94ks0bb7EZG9lIa9lXxcxnS3b5GWIP1sbiPSIy7K2HCwLDVe4
         j6wuWpFi1/8sMbAY6Lvi87yC29GfjKlv2H+Mj0PfMlfY+WrzkmuinGR+fgF9zQHuWz/L
         Wfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556110; x=1700160910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g73QTqa4YTCeJuDnfMTOW8eVS9xm1gIdRDmG7TjF/yc=;
        b=QTNcI4ZBVkO3AIuHdFpdyxQa+ZznoAd2GO9CuUCjZzqFHQZ0XxjI6abFl8hhXVSfcX
         HIyYyHIOjT8nfSh70z3hQX/aJSCo1Rq+JYvOH78QcZQ3mVija275HP5A/Y7Qtgj5CKe0
         gMqI9P5IPxvoX0RUgWZhFjeT4opxO9lhd441ABQyYHsk1tn+/3OAxTis0C6yxjUYtxgd
         jgk4jCsEBGJSBc2UOjuFw7kz6Tk5vJGD0VKaYH/FFrn/p6NVQ0aPVCgRVRP9LNB40XUL
         mA3dLMpY40aHh3oZk/FTI7dAABe/DUiJ79DlpoL3ve0zhEvRVRC3v0x2sbrbw6Bo1GQi
         lOPw==
X-Gm-Message-State: AOJu0Yx2XjaYKVvK/1uQX49XNYLUpFGz6EO+G/iH4C6sRXoTavc3/aMx
	3bM6fhumsqEewz8/Zvqat2Q=
X-Google-Smtp-Source: AGHT+IFxZxc4RDzX6HRIMX0zhVB50kMciGdcCmsIWNygaa4MSMM4LrRdrVRhjg7PMLTFpkHhpXk5eQ==
X-Received: by 2002:a17:902:c943:b0:1c7:5581:f9c with SMTP id i3-20020a170902c94300b001c755810f9cmr6369880pla.0.1699556110547;
        Thu, 09 Nov 2023 10:55:10 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:55:10 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 5/7] platform/chrome: Fix typo 'kifo' in commet
Date: Fri, 10 Nov 2023 02:54:37 +0800
Message-Id: <20231109185439.1535962-6-visitorckw@gmail.com>
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

Replace 'kifo' with 'kfifo' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 92faf701b8f0..6c2aa2651e5f 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -595,7 +595,7 @@ cros_ec_sensor_ring_spread_add(struct cros_ec_sensorhub *sensorhub,
 			} else {
 				/*
 				 * Push first sample in the batch to the,
-				 * kifo, it's guaranteed to be correct, the
+				 * kfifo, it's guaranteed to be correct, the
 				 * rest will follow later on.
 				 */
 				sample_idx = 1;
-- 
2.25.1

