Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3CC36CDFF
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082142; cv=none; b=WN+FuIvld6/m7U9sdXq6QWfJoeCiBRBtxbRGgVb7DDLK6Y+JHDjHXo7vpQLKRowQ19VuQyYtiU44dnpuNMETB5+M0gREXLnz6VFZXnoQaJ0q5uzHrpRmwXw6E1yNomdm+3orOh1lkSu2DqpG23PiOEwrezBwzsHiUxUcRkQ6dsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082142; c=relaxed/simple;
	bh=RwkDpJ4JMiS1lt6rgk/ttWd7Imn2DX4N4/is1V6nzBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHTddo+VST92D/w0Oef8DzdkslfgGKw7WyOOXRBwD61aCVUpr250DzqYuTx49r1gwIHxnWigOnjKpSrqzOcZK3C+4DrhcWMnlC+M23EpyFRJXApWvllfR+pC5nkn0XbCvjikvkXWev/FE2ciGe/YWDCVVZLPvpa+M6kyff7E324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h9I8odoq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h9I8odoq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b0475ce7f41so420451966b.1
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 07:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082139; x=1757686939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87ag1FHHaswWtSbB90U8zWSxgzWenXvtVjHwVBb5b6g=;
        b=h9I8odoqMZeVA2xDhBc36limbIWei9Klt0qMKUok4sEpNm92DhXzhEpCpm37l/4esA
         U0eqqFku5rq8fAD42CNholRfBp3XJDfOtjUs+xmOwFHhOgx6DkJH0WO80qh7ECOOGmiW
         2poHnTuLC/Sb5uBu5ZZ4Qqd2ayDKBXFkZ7a90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082139; x=1757686939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87ag1FHHaswWtSbB90U8zWSxgzWenXvtVjHwVBb5b6g=;
        b=KpKw46DK82VyBcOykVgWWsOgrje4Xr+PHcTCbYNM6KYEwDBWW59c0Xpks1BgA4JVpl
         un08udoR5Yp98+zIw62Pz+p2x6wlAxV1Q1zoRAhswjSKvgAl8/Cd2x5/nU9w1jHEw0g1
         PjSqrtihdJo79CgsB3c1pjONdtsu1N0j66fx3u7HGf2WJoNSNiVNCuOobxe3Nj2ICh2d
         umWOBSVG2wnOw9f+7eH8bmksMaRy/Je/B+O0auQphS5E1Tx7VRSsEQKcz9rMRpDQ8q+X
         q+xUmScPw05dUc4PeBvlCxDsT2gxRsB5gNfOnieBnY/WlexP6LI02WJaPZc40vRihJLM
         O5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhHRnAQW6w+8J+zqLWvtKTpJ/3IdYElI1cl3h6k5qcOFSWJWjfZxNAeV1qbJo1mJksoGQRpdQj2g3l/ooGGsQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoAFfKqPi9Ddaw3lc3KrSf/T0yT36DP3hfbmqt97tZ33z55Fn1
	ecmuVifKgjyoMg0iA2JlYPxdT7Z6aX7zPXQF4SD5orx6IhU9RUADS/WaZgglI1pqtQ==
X-Gm-Gg: ASbGncvVguL3CNh/UfVFUKD5OJTVcawiMx9Kqd8Niaa6VHMWSpIkBVX5c5/XrsUOC5g
	hQiQUVuYe12MzdEy1kS0ZIKKFPMCMSfuUt8R6UtzTu3ueRx4XbwgF5ub67ZALf8jMGllLDUVbht
	xr4NX/XnG08L08vsrqQ7Fez+LLixFFMhyOnKwt8q8LH+ei0POjaKqGWx7eAON8aTpjPIdaoGekf
	UmNvJpj0M8AATyi5ApeQ9hi4bItU0P8o2wb4nQHhap35QNmhT+UW/FvSsqoQ19L92bZjpTPSCGq
	5sY9Vx1MXmyvrEipwao0zcgDBHeBMCukJagrE5k4TM/OStnA5ZCjbNJyOo/6i39bLvckxOnQm4T
	UdeZEa/jthfApq6xeVua2qPDSndJ9jZYUOPtcD3ZsW/wlD7J/Ite+HuHiggE7Z/3a3Dj2BYZO3E
	RyzRRYwsS0yBlxfpU=
X-Google-Smtp-Source: AGHT+IEtSMMMoUQkrS0etMzB3nxVu+EiElCLzWoEgWR+jsVPfiruWufQaw8VaX46EwAq7cMBxoT5ww==
X-Received: by 2002:a17:907:3d0b:b0:adb:428f:f748 with SMTP id a640c23a62f3a-b01d8a72fddmr2287245866b.21.1757082139041;
        Fri, 05 Sep 2025 07:22:19 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:18 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 3/5] usb: typec: ucsi: Set no_mode_control flag
Date: Fri,  5 Sep 2025 14:22:04 +0000
Message-ID: <20250905142206.4105351-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0d6b0cf5a7cd..9f754344a841 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1632,6 +1632,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->no_mode_control = !(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.51.0.355.g5224444f11-goog

