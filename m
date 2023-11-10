Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3D61D549
	for <chrome-platform@lists.linux.dev>; Fri, 10 Nov 2023 16:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agASJukK"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6bb744262caso204631b3a.0
        for <chrome-platform@lists.linux.dev>; Fri, 10 Nov 2023 08:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699635166; x=1700239966; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxqRDZ+ztZSd9qnawgjaQAg5ACh45Q6dnAez8SycqZU=;
        b=agASJukKeTRmMg2Uc48KI4vuefd1eYHwETbJ+uxwVEhF/fXyA8GVEFjqgrX5UudQPB
         hAoJ97dOsIhNAPx38mAPHkE/TbFROjmoyoYCLpuYca+Ec7H28R+oD+Kl9VDwl0YCpMtI
         8/AYSB+kCf+3hNHCmerVm9RGgjnd0S+nwcrwOA7XkNvtWVWinCnUnBJUtQeQIHoZA6B1
         mPV9BCeIT7Z5rktZtPnphpgAJEx1FNFhTZ6q+Rzc7WlsroD1mIjwZxsdGak1DEk6+GVf
         3ImgUcvi1z2IEOhaiD1N3MyiQO2xomy2sPtNhmTz+FNdx9IMy8l9fs3/FpxDIe1ZnJfk
         tWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699635166; x=1700239966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IxqRDZ+ztZSd9qnawgjaQAg5ACh45Q6dnAez8SycqZU=;
        b=YIMFnehGanTFgkHKss80itP5mT026iHJ4/TqK5mmVnhm57531N08I16JYbFROx674m
         uk9GYSIvkriqN7xzWUyMifIaSM/1OCo9KlRUpQeRWURpeqYU452fIWhhcus3s01SyTI2
         2XjAlnwJWKf6B8qJCFZI/MlP0D7xmyZGcKEDikxbV0MiaK6arFZ0u/bdm1mQjTdeWwQO
         gl9tdQrmzU0bfcVtwHczFjSvnaYqlKKW6BViVMqx4Up2fFmOOPuHaqzpssXnfgcJFTul
         fvp0hvkBAT7Jmzcy0hzhCHA0kG3YBzbL/rqNfL+oDnqerWXtwm1k80RUdmIcMv9bR/vF
         uQKg==
X-Gm-Message-State: AOJu0YzAnw5pLshYYdS5DOU3eI/56RWWw3nDlbXhH3M6Qcm/SkxSxFQy
	cF8z8gpl4T7y39PXeQoW8Lg=
X-Google-Smtp-Source: AGHT+IEGxk/jLqGJA0yS3ZeTi81R4xE2ZufSKB2Rtpbbh9NrGc0xsWCOW69zHXopVbKhjoSWZEwD/w==
X-Received: by 2002:a05:6a21:329b:b0:133:6e3d:68cd with SMTP id yt27-20020a056a21329b00b001336e3d68cdmr10384496pzb.3.1699635166235;
        Fri, 10 Nov 2023 08:52:46 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id ka19-20020a056a00939300b006905f6bfc37sm12797665pfb.31.2023.11.10.08.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 08:52:45 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2] platform/chrome: sensorhub: Fix typos
Date: Sat, 11 Nov 2023 00:52:39 +0800
Message-Id: <20231110165239.1559109-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZU3GbHTA3x19h2Zi@google.com>
References: <ZU3GbHTA3x19h2Zi@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'preceeds' with 'precedes' in the comment.
Replace 'porod' with 'period' in the comment.
Replace 'noone' with 'no one' in the comment.
Replace 'lantency' with 'latency' in the comment.
Replace 'kifo' with 'kfifo' in the comment.
Replace 'change' with 'chance' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
v1 -> v2:
 * Separate patch series into two patches.

 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 71948dade0e2..9e17f7483ca0 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -103,7 +103,7 @@ EXPORT_SYMBOL_GPL(cros_ec_sensorhub_unregister_push_data);
  * @sensorhub: Sensor Hub object
  * @on: true when events are requested.
  *
- * To be called before sleeping or when noone is listening.
+ * To be called before sleeping or when no one is listening.
  * Return: 0 on success, or an error when we can not communicate with the EC.
  *
  */
@@ -175,8 +175,8 @@ static s64 cros_ec_sensor_ring_median(s64 *array, size_t length)
  *
  * While a and b are recorded at accurate times (due to the EC real time
  * nature); c is pretty untrustworthy, even though it's recorded the
- * first thing in ec_irq_handler(). There is a very good change we'll get
- * added lantency due to:
+ * first thing in ec_irq_handler(). There is a very good chance we'll get
+ * added latency due to:
  *   other irqs
  *   ddrfreq
  *   cpuidle
@@ -511,7 +511,7 @@ cros_ec_sensor_ring_process_event(struct cros_ec_sensorhub *sensorhub,
  *                                 ringbuffer.
  *
  * This is the new spreading code, assumes every sample's timestamp
- * preceeds the sample. Run if tight_timestamps == true.
+ * precedes the sample. Run if tight_timestamps == true.
  *
  * Sometimes the EC receives only one interrupt (hence timestamp) for
  * a batch of samples. Only the first sample will have the correct
@@ -595,7 +595,7 @@ cros_ec_sensor_ring_spread_add(struct cros_ec_sensorhub *sensorhub,
 			} else {
 				/*
 				 * Push first sample in the batch to the,
-				 * kifo, it's guaranteed to be correct, the
+				 * kfifo, it's guaranteed to be correct, the
 				 * rest will follow later on.
 				 */
 				sample_idx = 1;
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

