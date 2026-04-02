Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0F264A9D
	for <chrome-platform@lists.linux.dev>; Thu,  2 Apr 2026 07:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775116250; cv=none; b=ZEcRT7AB9GeQLe7CibrM1QtTrPt+K3665gv8c4bizflRIuPu1/idvkZNKuIV2PnL83e+JNzTrgvGeYTKgP7mQ2DyNB0EBubLWllRMiMnHjb8ypl6bsR5sMmkZNzi6TwscQbSyBbFHKOKiACADbLj9844pQtf3uDT4whdb7dJ+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775116250; c=relaxed/simple;
	bh=czfxnmzXViuK8LYBCaMOU9PhSX26RAsbF2dVUQK+RL8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=M6kGji6DJHVb6TyjR6YfSIodBpDM2bzvZUK0aoaV8PQQLsQnSdgS3UsbROIZziiVeC5f9UWLU5yYhUOdJMsobuHe1kS5E89qb7aPIfQDDLAjDrjW8+RHnvuf8bD8qS0bsHYKldv7N10V8H3cpdqFA64DgalsC7UXkXFFFggkSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=KnnDn73Q; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="KnnDn73Q"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad9a9be502so3798305ad.0
        for <chrome-platform@lists.linux.dev>; Thu, 02 Apr 2026 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1775116247; x=1775721047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=En+fua7i1xnlRCBY4EaRbPlqxfU5rNh3zfCWADN5kUk=;
        b=KnnDn73QxfjJmoPFR6gyS4VFJL0wiqqksZTA+KzvuEQm6qg5FORiRfZMQheF6F5nr6
         rBm52WX2VP6Kb0MVo60bGQIFElBMhnVVxo77dWZCDsR3clHPsn/zdrfCcbrosu6fE4HV
         riHQOkvH9PI2Vo+D9oF+stgmYf8Tv/k8UII6jzVl8O+33+bLYh5fpXJJUIZnqDvesZGJ
         LapW+JIarKzzhpW0Mxc6JcOKHVxVpkm3AiHcyOEbw1ZYZf+KIg+CBm2co0M97L0goFtB
         yIaeceKSZPDy14V2FZVMKJLYLzuyfQ4u0/BdVTy3kaw2sJdHq4U/VdEvL76k9K1KjfJM
         vJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775116247; x=1775721047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En+fua7i1xnlRCBY4EaRbPlqxfU5rNh3zfCWADN5kUk=;
        b=g1VF5QFebJ0kfkTWhxaNnRP2haVt1KFF7llveMmNe1gBtumKj3ZY+0+Olgq0P7dsTq
         7jjSDM+6kLUMs9DVD4ewEzqf8hi1ozY8Og8kVo9q3ro82J7iyKx5WIKePnrR+6vVb+Di
         RtvWLb+XZQ+6SCLJutVB1rWpWiEjd451dHTy0iegBFVw56emILhQJrIctHQk1owbbhcO
         QOsLjnB4/VXlwDTRTnSX/4wEh051PlKFsXYVonBt/KlGU0TSvYNzVCE3swVJC97iiC3o
         VXcE9Q0pl12qUipp+eP5ngTfraJNO9R7i08G2y0WWV+9xfFJC41uc1LKUWyWBfFtkGj7
         qxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqr3V+AcqMmglXqExfnYWu2aq1LWWNw2gHOj4dmJjKrv1gPqI0EKYTY7RcfzrPze71OB5KdCEmeIdpiTpmIcE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgG71vsX07LdLfpD8UrftGtBLpgX4WAH8bmgJvLwiidG+yCWpd
	kGL/lQbxQm5uiJAer0qOgUbfCmzqHgb6rIXQh8A2PjVOf59iPqbzeUmddCrfHieMyyA=
X-Gm-Gg: AeBDietNsya1ugV/Kb39JSpQFzIwbnODV1PNJccg63zuCYcXY8trwR5AyLMgFlseWpA
	uIMYsZ/J8IWF6/bGa3PSUp9Rf3g4bC8zUFGcrmygIQJeKcdN65Rg/n0E8xadRt/mS/ibuk2ZxCI
	Ry4mp7dqbud5iKhzeh00/ZYwEWGS9JgPoJoBQ5flSOYBE8TIzAWSWw62B8JY1a2Et+O7b7FCHec
	ZtyUX84IM1O2QIo++f2qzSW5DE0Dczuu989fhbWrW8I/6H9X89oAdvQIfuE3OID1SOLR1FRNkSd
	om+KuNYPvHv77dE1jOeJYB9kx3Rx31BzOv9JgxOaaEI+zgvRLvVki8YPhwEw0xTtvY/xLimty79
	1PG/wNzJQbayG7QBUmaH5fsdZ/YlTsP9gdz2DIYlVBiI36viasd6dgIyoUy/6UT3l7yVKRAAYq6
	IapWq5gqGeus4iSSDQWoPEiRoGuwVlRbB7CpG5iGJV52PdMy25k1O7St+x9qn0rgqngiU+Z4s9U
	SMyOWypSdU8/noIbGsHPQ==
X-Received: by 2002:a17:903:2ec3:b0:2b0:66f7:f7cb with SMTP id d9443c01a7336-2b269a8ca44mr62732555ad.7.1775116247083;
        Thu, 02 Apr 2026 00:50:47 -0700 (PDT)
Received: from localhost.localdomain (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478bc96sm19813955ad.33.2026.04.02.00.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 00:50:46 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Guenter Roeck <groeck@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>
Subject: [PATCH] media: platform: cros-ec: Add Kulnex and Moxoe to the match table
Date: Thu,  2 Apr 2026 15:50:08 +0800
Message-Id: <20260402154921.1.I71ce228a830321a80f99a9ad830d027132859e56@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Google Kulnex and Moxoe device uses the same approach as Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcceb..4b3f9bff6067a 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -334,6 +334,10 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 	/* Google Moxie */
 	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
+	/* Google Kulnex */
+	{ "Google", "Kulnex", "0000:00:02.0", port_b_conns },
+	/* Google Moxoe */
+	{ "Google", "Moxoe", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

