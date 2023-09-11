Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBD3D8C
	for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 08:19:57 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-501bd7711e8so7132509e87.1
        for <chrome-platform@lists.linux.dev>; Mon, 11 Sep 2023 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694420395; x=1695025195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgoHp4sSbdLPnwsP7QBEFkRKlD8fQKCxSLeR/YtKKwc=;
        b=iIdyUM6d/qdf//1ba20eI8vqMdaucTW8cAdGpLDd3L01lQGhLBgE3f3XWXRJphhdt5
         Y1oDD/HaZ8sujq5aX11G+o/2etF7vwuj3w6hefOkmHc0FLSpVTRgmcbWZnkkXuqJEnsn
         LwsygSD+2v94C7TVwtgUwSfC+V0C+X9mCraU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420395; x=1695025195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgoHp4sSbdLPnwsP7QBEFkRKlD8fQKCxSLeR/YtKKwc=;
        b=LvV4EbWuQKSnOFtjfowl9Dz1S1GX9BSSTQ/1qOPD4u7BUVyRHcioZbDApQRZC9lyS7
         0UCmDrpC/7dSIdEHOornaO2JAtzPz6R4M5L68xwFV3nIT5TggmllKruLiPzZXnj8u/9J
         KIOFC1YFIo42+gwa7CFQKkszUoQ6JoxYCcQpMHt8TkBIijxxNkSSKbWQaekTKmOtSty/
         zqlnKNhu32TNQ0T1jz9kGeJnYdw9rodvpSfvSoIMrdlxeCnRDAt5eHtQDkqNEg6AFwMy
         Z0IAe2IRTzcaJOcwI+3qnf0JE2+eKn4Da1G4wKL+4XzQ7i+thOwX1fcS6oIx7ZNGW5qC
         qVkA==
X-Gm-Message-State: AOJu0YyJtjtnuUHeItGnQRWnv9Flv6D666HRQyjv5cuxY+QXw1y1x2ho
	2UIWgs1gwnrpr2aDNTX81ScTJw==
X-Google-Smtp-Source: AGHT+IGKXkVlvpzb1jXGc7GPA/z62m6pR7a/3NtlCutcvnuu34bb7zCIn6QwlQhJ2uEpgzghSPTdTA==
X-Received: by 2002:a05:6512:3f8:b0:501:bd77:a4b with SMTP id n24-20020a05651203f800b00501bd770a4bmr6358700lfq.9.1694420395351;
        Mon, 11 Sep 2023 01:19:55 -0700 (PDT)
Received: from localhost ([2620:0:1043:12:a329:942b:177a:d4d])
        by smtp.gmail.com with UTF8SMTPSA id z28-20020ac25dfc000000b00500cede2786sm1268411lfq.65.2023.09.11.01.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 01:19:54 -0700 (PDT)
From: Stefan Adolfsson <sadolfsson@chromium.org>
X-Google-Original-From: Stefan Adolfsson <sadolfsson@google.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Reka Norman <rekanorman@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Adolfsson <sadolfsson@chromium.org>
Subject: [PATCH v2] media: cros-ec-cec: Add Constitution to the match table
Date: Mon, 11 Sep 2023 10:19:21 +0200
Message-ID: <20230911081921.3515928-1-sadolfsson@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Adolfsson <sadolfsson@chromium.org>

Constitution has two HDMI ports which support CEC:
    Port B is EC port 0
    Port A is EC port 1

This patch depends on "media: cros-ec-cec: Add Dibbi to the match
table".

Signed-off-by: Stefan Adolfsson <sadolfsson@chromium.org>
---
Changes in v2:
 Use a NULL-terminated conns array for the match table entry

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 21361eff50ff..85431af65224 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -296,6 +296,7 @@ struct cec_dmi_match {
 
 static const char *const fizz_conns[] = { "Port B", NULL };
 static const char *const dibbi_conns[] = { "Port D", "Port B", NULL };
+static const char *const constitution_conns[] = { "Port B", "Port A", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
 	/* Google Fizz */
@@ -316,6 +317,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Lisbon", "0000:00:02.0", fizz_conns },
 	/* Google Dibbi */
 	{ "Google", "Dibbi", "0000:00:02.0", dibbi_conns },
+	/* Google Constitution */
+	{ "Google", "Constitution", "0000:00:02.0", constitution_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.42.0.283.g2d96d420d3-goog

