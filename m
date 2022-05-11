Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB617C4
	for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 08:54:51 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d25so1397360pfo.10
        for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um6Mtxj9hn6MLF0/DG+dua7GL3nWe8jP1xt8gG30nLY=;
        b=oWFC3+tjFWuEzvrTD6PLpUDog2crstg0UDDK7T5h63Ev/TycWAdosWnW3B8xZx+Ii9
         pXeL8gStKi3H726nItUKPwvf3bK6BqVfeAR9w9JpaHikJk4HmVr+RQuzq9FsK+QOATHZ
         +eX6J+/X1EQF9VA6fWroiYEy7V9q4n40m6SMq+1qYQbd/uo9IY1IjAGYhXzBv/P40oaU
         u6bcuxKjUiLb9ElQ3gWbpPVaH9/ZMDvJ12XhEut73/QxTQr9p5ah/H5v/OTUvKhQ+X7e
         6rUc6LGrU4YtZcS05UjWlmL8Jq9rmLiDaD20TIO7VfNzVLUr6Q5kfzsx5oQiU6Ou1RSv
         tNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=um6Mtxj9hn6MLF0/DG+dua7GL3nWe8jP1xt8gG30nLY=;
        b=24I+4MhLvuo2v9sQvBKKkMB4FsO0FYMqoC/HcFquJG63l5OoDRd4cgf+sMbcrWay0Z
         m7Vls7pe0wGLopK4qG1YM6Cp1E6bW2qrqAXn5Eu4WCYPbyVMIF8mWlIzuGK9qy4k5D0U
         hDsBZVXRs/I89DfVpwcZXkZfFaFec4S5REUDxMioP/mcJOxy5cerBhs+ZdPvBw/Hhe39
         GlVDcGgE1cssMqZzAV8kANOyOs6LxcdJ24WcT4kWG9gBRgPtERf2G24yv7EgggfS6OP4
         6FxegqYLLBdt7MqomuIDys9jYmh1RDptHGcZ0v5wVzuVAMAt5zgNkVcpzlTolftvWf2R
         tnAw==
X-Gm-Message-State: AOAM531uzhwbWaVbI5iRAVHgyOsxRjaK36/RF6uc2PW+WphxBHx70WG5
	c6/F4FqhVyCDzPUtmZokrZg1Ug==
X-Google-Smtp-Source: ABdhPJx/bnrxyo+MiOlZiVhC8KX3b6hkIYIcaQnvbU8nuJP5jgO8L6bFg7hbYAuoTjK+jW0KjksrZw==
X-Received: by 2002:a65:6297:0:b0:3db:4820:2867 with SMTP id f23-20020a656297000000b003db48202867mr239308pgv.503.1652259290924;
        Wed, 11 May 2022 01:54:50 -0700 (PDT)
Received: from localhost.localdomain ([180.217.250.247])
        by smtp.gmail.com with ESMTPSA id e2-20020a056a00162200b0050dc7628136sm1118590pfc.16.2022.05.11.01.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 01:54:50 -0700 (PDT)
From: Scott Chao <scott_chao@wistron.corp-partner.google.com>
To: hverkuil-cisco@xs4all.nl
Cc: mchehab@kernel.org,
	bleung@chromium.org,
	groeck@chromium.org,
	scott_chao@wistron.corp-partner.google.com,
	zhuohao@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: platform: Add moli to the match table
Date: Wed, 11 May 2022 16:54:42 +0800
Message-Id: <20220511085442.23915-1-scott_chao@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moli device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Scott Chao <scott_chao@wistron.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 8c8d8fc5e63e..25dc7309beab 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -217,6 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", "Port B" },
+	/* Google Moli */
+	{ "Google", "Moli", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.36.1

