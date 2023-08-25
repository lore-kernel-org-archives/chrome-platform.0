Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9A7E0
	for <chrome-platform@lists.linux.dev>; Fri, 25 Aug 2023 02:53:28 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bf078d5f33so4732385ad.3
        for <chrome-platform@lists.linux.dev>; Thu, 24 Aug 2023 19:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692932008; x=1693536808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ka8P5b/GzyZWqOM50pHONHl9tEIZnwSQ0LsDJccYJvI=;
        b=BzlEs8cAdigCMb3vJPqRNzIb1J1HMXhrk6+GbBQGA0k1l767wGfP7XvKmyt9yAyOSA
         4etFUTYoIV32HK7WWxK7y/MW35VnO29t51VsENsZjk8D0lNdCawf9uRWsfhEM9kerzDP
         pqrTeOgtNfEw/WuzoRZxu8+I4r+gFLu83Og5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692932008; x=1693536808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ka8P5b/GzyZWqOM50pHONHl9tEIZnwSQ0LsDJccYJvI=;
        b=f0NLSTmLLLwkJGBOVh8TpW61PlR70dKwKn+c8R0VDM4eZ74UrVdhjWGobwDIOJTP06
         vRtCP1Lq7qghxTpMad1jFj456H8Rc7APDRjE5+2qBHXRejmHO0lXzd8Vyvr9uWsBCxhG
         BX5NRjScD4U7z3YRzK81J4RGWepcaWDLTbKNuzWx+/4MfXDzqqKHSWbP9BxlETj93TNs
         CKPHGZxxMei/463s3BvNnAy+fwplwG0ixTE/aPDuUZTDK8COxaw7eThz5H04zL3xby2K
         khYE6Ka1oH9dkQh6hTCwujhSkM7Tv8dNTq9bjTkyRDfwGeQwWkNQTkBt2zZNpxfooVq5
         jgEw==
X-Gm-Message-State: AOJu0YxB7MWoD12j3f4qszFeIyv0L/x4m+a/a6rZJ6plNHveUFVUNT+0
	4HnvSL6uNp8q85wLfWYAiXqKVw==
X-Google-Smtp-Source: AGHT+IH938af/Jkw37fRHmw130aKNQYszXvCGp+5zNX3Tkto4r7N0993i9603PTTX5fDrm5uQLkqvg==
X-Received: by 2002:a17:902:f54b:b0:1b8:92fc:7429 with SMTP id h11-20020a170902f54b00b001b892fc7429mr20923761plf.53.1692932008269;
        Thu, 24 Aug 2023 19:53:28 -0700 (PDT)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:9fe1:d4b1:42cc:882f])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902a3ca00b001bb0eebd90asm420847plb.245.2023.08.24.19.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 19:53:27 -0700 (PDT)
From: Reka Norman <rekanorman@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Stefan Adolfsson <sadolfsson@google.com>,
	Reka Norman <rekanorman@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 9/9] media: cros-ec-cec: Add Dibbi to the match table
Date: Fri, 25 Aug 2023 12:44:02 +1000
Message-ID: <20230825024735.1443836-10-rekanorman@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
In-Reply-To: <20230825024735.1443836-1-rekanorman@chromium.org>
References: <20230825024735.1443836-1-rekanorman@chromium.org>
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

Changes in v2:
- Use a NULL-terminated conns array for the Dibbi match table entry

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 993deb85d3e2..21361eff50ff 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -295,6 +295,7 @@ struct cec_dmi_match {
 };
 
 static const char *const fizz_conns[] = { "Port B", NULL };
+static const char *const dibbi_conns[] = { "Port D", "Port B", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
 	/* Google Fizz */
@@ -313,6 +314,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Gladios", "0000:00:02.0", fizz_conns },
 	/* Google Lisbon */
 	{ "Google", "Lisbon", "0000:00:02.0", fizz_conns },
+	/* Google Dibbi */
+	{ "Google", "Dibbi", "0000:00:02.0", dibbi_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog

