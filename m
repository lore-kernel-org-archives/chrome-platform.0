Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717361FAA
	for <chrome-platform@lists.linux.dev>; Mon, 14 Aug 2023 04:36:31 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6873a30d02eso2483827b3a.3
        for <chrome-platform@lists.linux.dev>; Sun, 13 Aug 2023 21:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691987790; x=1692592590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw/GQaD3rU/TBdDdqv1FKm319ZdMh7XMHhK4oOmrPsU=;
        b=KatNqGsGMaYxzyICLAb1aNPS96VJXjgi4wqOangQ1EE3F01ND5r4MCspJg8i4p78so
         u+ujbs8pFRq4DfPYFH5HQ2ZBjvthy6kKTTak+DBCypQ5F6GgbI5F1IiZ5JfNyVXtLGxu
         bUt0mJTRZT9bO5Cq8yEcm9x010l0xHCmkMMt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691987790; x=1692592590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sw/GQaD3rU/TBdDdqv1FKm319ZdMh7XMHhK4oOmrPsU=;
        b=RucHya2faM7RFtLyMf/YlXuEcRvPggCHCiqMMqDugdwL/rO7yuJg+1xXhNX9vu4l75
         SjKBSp4ECzGm00SUj3+S2reUNuTMe+A2YmwUkIh1DgGt9eKt+U9E3IN1z6YSTJGyaipx
         +UQtD2pIiPnfFPs1ogTCd0Dt1D8EOqDThkG8ZpevDJ1rF7vik2k5XM4fJ+Hm2Vej1/oz
         NN0CUZlbbqPN5GALJLUgPJTMSdKWVj5AIoGqP0z9T40IUUFRc7BuyIXfs5rbFNMUWu41
         zMlc4VquVLZ5HD1K6CcFdvo12FD+GlxkQWvYBcvDS1OH+ZwR73Bdw40ZSgZOymW3kRGD
         rNXA==
X-Gm-Message-State: AOJu0YwyL1Gc2Tr/JqY/jUWELnVVnG8mKmiMf6N42r3sY+m01TkTJGu1
	XZpZRCvbNlYyUVFiVKHppoZVJw==
X-Google-Smtp-Source: AGHT+IErHRAwMUUMfXSyxd/9DtxgxyWOztaiQGKgeItEKpDF/uQEjh27Qutpj+qSs8LmqlSMCPq4qQ==
X-Received: by 2002:a05:6300:8003:b0:13e:e450:f4c6 with SMTP id an3-20020a056300800300b0013ee450f4c6mr7113497pzc.27.1691987790656;
        Sun, 13 Aug 2023 21:36:30 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:4ae6:d1a4:27c2:80ff])
        by smtp.gmail.com with ESMTPSA id ju17-20020a170903429100b001bdb0483e65sm6761865plb.265.2023.08.13.21.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 21:36:30 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 9/9] media: cros-ec-cec: Add Dibbi to the match table
Date: Mon, 14 Aug 2023 14:29:18 +1000
Message-ID: <20230814043140.1108917-10-rekanorman@chromium.org>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
In-Reply-To: <20230814043140.1108917-1-rekanorman@chromium.org>
References: <20230814043140.1108917-1-rekanorman@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dibbi has two HDMI ports which support CEC:
Port D is EC port 0
Port B is EC port 1

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index cfc0a204d591..29f9a464857b 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -311,6 +311,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Gladios", "0000:00:02.0", { "Port B" } },
 	/* Google Lisbon */
 	{ "Google", "Lisbon", "0000:00:02.0", { "Port B" } },
+	/* Google Dibbi */
+	{ "Google", "Dibbi", "0000:00:02.0", { "Port D", "Port B" } },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.41.0.640.ga95def55d0-goog

