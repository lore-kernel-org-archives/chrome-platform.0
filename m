Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E861B19456
	for <chrome-platform@lists.linux.dev>; Thu,  9 Nov 2023 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTecOB7t"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1cc41afd376so1916475ad.1
        for <chrome-platform@lists.linux.dev>; Thu, 09 Nov 2023 10:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699556115; x=1700160915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kg9I4ZaIj7Cn80AZ+YJatc/DGTkLCa1gLvsiD/shfvU=;
        b=QTecOB7tlpQu8af1Rz3ssYzsCj0WZ1witdAiGpU2Jv1CzTeNxWYxKD9QKN0pQcdm6b
         3P+IZul2ZdWgWfuj5/CJkg1OwofF9ZjY4P+FDjEITowZ5VGf02mhc8eu4lY9RI69qIK2
         zR2o3UuRNN8mQOAqaxHpGoPuPaN2c26S6TwX3nVjpIOIF8iJGEshs+0h+qLARJz/VSXa
         48G06Oo2W/HEv+OR6dFs1mbLwN5ECHQZ/5TFXqmgGdHBjaotKWk2wY3Lu4RH5GgBGXr2
         GgIrVfMk/idJIDI4h6iE0TZD1nsD36wxKv8LikR8aj4J4bludmPbATzfXPzvTBIn6JJX
         Xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699556115; x=1700160915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kg9I4ZaIj7Cn80AZ+YJatc/DGTkLCa1gLvsiD/shfvU=;
        b=IvYY7qzrVj+Gst5Cdg+8ktuCbnXSlWgmR9jeQbk8cxga0v+Ku4cqr8Yk2RDP3rkgdx
         HUxKOuFAK6mFeguB8NKHBdyLGbuUJyjYsZvzWMisBILa1JRlpTNU/fALtwsJWI5LvwYS
         WDMVbEAqVwN+QrYRo84gQeYENl4pkVcAFfZuAgv74TOYLKmarAtDWCX5Zg5S7Y5ypQD5
         nSoLC1YJm9j2NbBgCtFo1SFB77PVE885sJ/J+IVLzW4y7c+CEuTLcXhqAqum0PUREJi5
         CWLG3QA4xm2827kQxwRKktCtdcdN7cUpV2ooXwe/vr/qBRbnx+Tx8YxvRv5bPab2BLol
         LX1A==
X-Gm-Message-State: AOJu0Yzw2AHFsuI7LqmkpJ4ekbE0Wg6vDtH454XFxbro69UxCgZtil/F
	/3zAjG1a5FFNA5AehbmYlwI=
X-Google-Smtp-Source: AGHT+IEtW1oaVYd/An5rg2FaDM6Q0s0wAl5Pr2VY0eMfJkPWNQqJ1LUHlgMkwIfQk4Ow5hwMKO0bCg==
X-Received: by 2002:a17:902:ce8c:b0:1cc:3e45:ac1e with SMTP id f12-20020a170902ce8c00b001cc3e45ac1emr6334586plg.6.1699556115257;
        Thu, 09 Nov 2023 10:55:15 -0800 (PST)
Received: from localhost.localdomain ([140.116.154.65])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902d71300b001c61921d4d2sm3821837ply.302.2023.11.09.10.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 10:55:14 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: groeck@chromium.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 6/7] platform/chrome: Fix typo 'change' in comment
Date: Fri, 10 Nov 2023 02:54:38 +0800
Message-Id: <20231109185439.1535962-7-visitorckw@gmail.com>
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

Replace 'change' with 'chance' in the comment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 6c2aa2651e5f..9e17f7483ca0 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -175,7 +175,7 @@ static s64 cros_ec_sensor_ring_median(s64 *array, size_t length)
  *
  * While a and b are recorded at accurate times (due to the EC real time
  * nature); c is pretty untrustworthy, even though it's recorded the
- * first thing in ec_irq_handler(). There is a very good change we'll get
+ * first thing in ec_irq_handler(). There is a very good chance we'll get
  * added latency due to:
  *   other irqs
  *   ddrfreq
-- 
2.25.1

