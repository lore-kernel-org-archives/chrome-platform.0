Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E521126C02
	for <chrome-platform@lists.linux.dev>; Thu, 27 Mar 2025 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043171; cv=none; b=NHA/+K/9aAG3cEmd70AgFu9/zaPIG6BR4OHgrThOAAHORLF3kWCxYNDJ9hNQPBL4sE8bQ+vNcNj8EYdXOWjTkWNPkZ+HiN6w7D5XzO1zoVuF5tFM+ACTlApts0fwDEGjUMbffngkaO99HMoQMNFsgjPaA4B9bBKchJun4iMEoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043171; c=relaxed/simple;
	bh=bfZnAhWbIHetf94vPVxB6NVwMTgNEQjCKhpHr0TUlx8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mE3Vu2ZJUn9p/j4VTEi4Nz8jrS1ISU7nNCPfYKP16Z3BAzirE0U6+Sj3Ggd0Fxr8DsPmVpzu/601DJFZp8aa8GGaapDGvtCKgF6T4ulOaB1Qhv8PjATDAiCkYNn0aoTVNlTCUjL1t8fMX/dnBFWrHANPKUBbELqNiBrDif2b93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=XH5SV8rl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="XH5SV8rl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22423adf751so9588655ad.2
        for <chrome-platform@lists.linux.dev>; Wed, 26 Mar 2025 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743043169; x=1743647969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khaZwp5Vq6UxSHSInGWQoaGrGmu008TcfrCzn3Sp1jE=;
        b=XH5SV8rlVoWpXou1lgIZVDAukqtSUp69HvbLU/ltzm4y2DmnURoJ6WtjTFRy04qucx
         e4bvvbrlICZ7r0LCNKO/GBbm1DGcHti6ishgZmOdALGw33PAizTh9h3FJp+8/+jas8Te
         q9bnOnSqoC7UYyyFTvPmIEjNXFs1PKh2dWYgosyGHFzAidCvqw5dqyL1aSgSJM7FBGGv
         nVryro4m8Ahnu+7I/B3JAy3wl/sztgXrlyTsoQ5G69eG/8bOqr7hhucmY5MyVvWvEHBA
         kvW3GG6abfkbPC60Y7bjeDBhL+iJ24WFxCi0pqKRIQVlxj40U3NbWV/R+n/CQ04/95ju
         zChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043169; x=1743647969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khaZwp5Vq6UxSHSInGWQoaGrGmu008TcfrCzn3Sp1jE=;
        b=fwzhhpOsSf2LvYJ74x+1JXp5MpFrL3xHqA2oqF4RsnEwPcogA4u+Z8cnVmG9U2Qbqd
         yDw89g1icmBeWcfj+ld6ogR6Mg4/uQUl/dkS6zFjICqO/jB6MlSAdn/5zFOg/7EI87+O
         qNkLt8EQzqeGqZawvpPWt4KZRWDnCXl5CHtBoCg7qVbK5aGH6ns8WQ7UC0H5wXm9Y7/o
         4WDIpD03Jlvaw8+alUVxZr3ItcncS9M8b28NbukNq7aG3/gYDWanryn+Q6JyIbgtkZMM
         sskOdQ+nYXyZCxkicLaO9kXnJzKPsgbx0y0t6+PkUaTbdIH0mjpjxBbzBZ54DgUpOz79
         8hlw==
X-Forwarded-Encrypted: i=1; AJvYcCUjt0TqnWoaxhcBFlSWGj9JnJhAM+yo+0mq4fB4jqgc5ZxhDlOx8hS8RzTIrNcQwwWIh2roec1Ftn8225UJW0Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj6JH07W8KbWdD1HXb5T8ochbgzYylr9wHd1rArp1A4gPMVFsl
	dNJyn/t2O78b596f7N43r98tzQ2X96IDqjWpIV4bI+VAeQWgmu0F667JcJzHiaU=
X-Gm-Gg: ASbGnctEzrcjEYlsD19vS+qeEW4RPMnW986QiE51Uu026Ah03J7xl79/FwCDRc6K6RZ
	KvwSPn4BMeyTvHUQ7jGNy/5N4cRt2lZMm4fwbJkmG71uRx0p5VTuzb1+KWKzSGCFp1Y58s/bSvT
	1ZpFHM7nBgJvUvn72F+vyE+9kG5fROvIPcjTfx+nGCL5qZ5hrs/hxtQDyxLfj9eYFnHV7Oqy9zO
	U1gcjOcVj2Ah7iOi92q3822csGakFAuCR5dq+653/7R+dMizlMMC+mi6/gtfUIR8GK9n+aH8tnM
	bHD2Po71+Q5163fgKo3lrRN5NyTAG3aQ/L1x/LkrGSdikw6vr9pjwWYFyDNrP/bDaOG1eViqXW1
	AMwXsH4l31ULpE/KcvqFlg6Zyt1cCLo2VoFxbug1OSvAcxtgGcBMmhcgPQ65hH3jjYzg1h4Fb/2
	P90ka3
X-Google-Smtp-Source: AGHT+IHVjsfEKk7SQAq4/COA7W8hgn5DQ0NFXJ8KTp6oRzGgyMHcaaVaDn7SD+ynl26dPt1q9peR9A==
X-Received: by 2002:a05:6a00:189c:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-739610dbcecmr2571003b3a.21.1743043168560;
        Wed, 26 Mar 2025 19:39:28 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-438c-4ad1-9019-9f7c.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:438c:4ad1:9019:9f7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm13027897b3a.152.2025.03.26.19.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:39:28 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	groeck@chromium.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] UPSTREAM: media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 27 Mar 2025 10:39:21 +0800
Message-Id: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

