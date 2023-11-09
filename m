Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A235D2ED
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWblSsI0"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ca85ff26afso2564255ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556107; x=1700160907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRi+qAy0bRoafy49vwIjB8vcVV09afunArSCgU/jH/8=;
        b=cWblSsI05tDOMypX8xc1WVNcFcYPSAC7D3nTWdbC+1jZb/Ihvsn/kHaavWKw8gs147
         xN/ElTPi/CfWdh4eyxzgXPDcjfLlUL5IJSwPCFeNFGGZ5GsIBiQ+cuUFwCcOJFWpt3bK
         4tdTXRbsWWExy6zZlneiX8Os5w/nv2DeOtXelShrQ985VAkb+3OvCZoh3L7ymC0JYzZL
         B79TDj5bLyJaoF5be0zjFUOAGhxkUzDnmh462fxhXiEM6mh/nbTX8HY6Fu2cz7VZGCc4
         mcf/AUmCRMmXPwDunjQ5dYR4xNdbDLLbks7ZH5ndTguowIPVdgzgiMOVCGw5ur30CQmm
         ET6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556107; x=1700160907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRi+qAy0bRoafy49vwIjB8vcVV09afunArSCgU/jH/8=;
        b=h3vG75N8cuGqebYz9lTnwKn+18fdxbslRaUX6P2sA1iGLcYzqA2YcySrneNheAQBUV
         oz/SjCEvi4nRJc0LBbzPcItTjgwoOc7rgUCPpI0DCjmkvX4ynZ4c0uBor5X8s5Mxv+vp
         jwFkVnVPykQK94071vmlthIdYNR2Bbpt5xIk7EtQNel27TqCtNsx+1eSRjcvMrzR9Xxc
         Nt+09GOU1HhVqmM1dn9sSZN+HBo7k4cM2dNFwcYBK59UECqW81VMF7WJWljK/u4tRc8/
         peMdulMayE4W/8rsR6pH9/w9IY0c0g+EBHFIAwivlJsemVH2XjTYOLEkfvZW+3U07o06
         ONoA==
X-Gm-Message-State: AOJu0YzcMT+nJ5jKEwagjze3NEJigPwhyNHrM/CEDUcXk2amhr0iU0p3
	SA8++UzBGQ3oGvtYV26PIWY=
X-Google-Smtp-Source: AGHT+IEjlXJkC2bw7tWXPOMaDfWHKiPmPN5r1CPOZIEmM6XpA/df2WMR8wr6JLELmvE8T9Bj+So2cQ==
X-Received: by 2002:a17:902:c943:b0:1c7:5581:f9c with SMTP id i3-20020a170902c94300b001c755810f9cmr6369730pla.0.1699556106845;
        Thu, 09 Nov 2023 10:55:06 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:55:06 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 4/7] platform/chrome: Fix typo 'lantency' in comment
Date: Fri, 10 Nov 2023 02:54:36 +0800
Message-Id: <20231109185439.1535962-5-visitorckw@gmail.com>
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

Replace 'lantency' with 'latency' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 85764e62cbe4..92faf701b8f0 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -176,7 +176,7 @@ static s64 cros_ec_sensor_ring_median(s64 *array, size_t length)
  * While a and b are recorded at accurate times (due to the EC real time
  * nature); c is pretty untrustworthy, even though it's recorded the
  * first thing in ec_irq_handler(). There is a very good change we'll get
- * added lantency due to:
+ * added latency due to:
  *   other irqs
  *   ddrfreq
  *   cpuidle
-- 
2.25.1

