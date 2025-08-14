Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5EA23A989
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197106; cv=none; b=E3HhhgGJJVErI9YP16TAlAy6rPU1uFXx2BF1yGAaRLGxfHxrCwBPX5yVVvpyqPjssnU/CFjxSPhvhwDD1HgOqjgYloNIeWp6qQ1jiL4ylJLAbqdgaruqr+Opeco68TL4wVDsgApjgKJhwlYWRGq7NhdDdSuryholUiiXA82Z7l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197106; c=relaxed/simple;
	bh=E3gkZiMJy3Qekd4+VwlRIk3WdC/Pz+bTehDrLOXH3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dtxtx2sx4LzVEQ5ib3Ns0wGosz5wXKopn0GrPnrVE/E/Qq6Z6wcNoyb//w1F/xXSF4emtLHKJvtsTJBKSD+t2TOK7oVbUCivvu9gVnVpGb4B2BkCEEv8aEqFYH3+98suIsgCPxbZhefFAlZGpfWS56F+6ka8zcCBh+6+3MpXCx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ge4AyTLF; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ge4AyTLF"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6188b733bbaso2423891a12.3
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197103; x=1755801903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuaFAn8mD8lF/OW0DQcqSD5HNRrV4Il3w/RtqwKWzZ4=;
        b=ge4AyTLFvLQzENpKnXS/+bQcg18zvzNjblbG+hYEyAGoxQhZxCNnbJTgd0STsJ6d06
         Zst0IUSk7J/sLH5aPCrBwQaJzlGEyBH+U9lrXCn+6LksohdfMwWu3Qswt+UmH6kerOm6
         jDqYaAL0m7gMdherHhjmSe8bdz3v1NHnV0Vrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197103; x=1755801903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuaFAn8mD8lF/OW0DQcqSD5HNRrV4Il3w/RtqwKWzZ4=;
        b=dtH7PBtKTrglWz2AFwVGoVmzUDO1bifCRKfF024iWCVXwl3o+udA3kU//4IuhzDk1x
         vgomyUuqI8T4K+Q2q6PPG/7+YyvTacgzE7PwXuKDYiFZ2k63elJTF46goYRWhX+hUYw+
         UA5k8Ryp5HCeaZdbaZHOfEBNv+GaM3j9i7qZV18htdkuw/OgZaAOdgT6ekNzReEAbb85
         R4McemZBYF8UXDYdity250VsfGWTetjy7MScm/CHyTTzq+LMOlxaABwwac8pgvQxDsXw
         oLrEkhhg557TctTNjHh/7KkBd8btW+ef22KGYxrsHmakAwJS79h6LA+txqZZ2VH0/1SI
         xQNA==
X-Forwarded-Encrypted: i=1; AJvYcCWxJBtZFEa5/TdwBtGqo56jFOwetYNUf0bSBT35Fbf4fBtQb9EtIy2Fce6u+GRf+xUZMcMpBzAwmpY59EpxKjs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvq5HtTUM3yFRqS8jWLblnWOUz63me+kM1BdAnSfQf7kIBHl2E
	O6wP13QWw+6dCzVapI5BZ0SENNNqI79GFcWCO8ULF0yNKsGh3/2C+pVNxi43qZq1qw==
X-Gm-Gg: ASbGnctQ14OO+jdRtJoSwmel6fyk/QCihdhQr7O9KKJYGkRdpzife+y0qBre2N1AdWj
	WJ+amVO328R/BxBXleMpZiKUI1V4BqaX8d5El9lyebTNO0NOh/7xgHRSZz7vHCI3Onu4xL1WYd/
	HZ8U8x0XsUuKMhotstdA46WJpJgwbcpwyi9Kcc5MWJkYNshI5J4fEHU5NfEsEAtQ7nIDVGUOAxK
	GVHBF56HWp7l+GL30VDbEY6OBT5s3mWU2O74H5N078EveoXkaiu9xuoGQ6fHnswdD86m5qC9kH5
	g8Wsb8Qlky7dEXKnLahVTcKC5cHxaQZlYC1x/Mve64ehz2HL//3oAUt/Hc0L+dJENzAvYYTLKVN
	RvOiiegxjx3StyBXOAtiMcQdYHSa7HQ88JIz7cILgnjFGHYfu7hUE2hPH0LCSJGJqRF4xiESGKH
	ug0a7HArVN2hJxJ8m8qj8Mxec=
X-Google-Smtp-Source: AGHT+IEqCZJqh3teh+GhByw+v1VIC6n/AQos6jbLx57TxiI9cPnPVwtbFarEeGQNwPBfnwrymbSlRw==
X-Received: by 2002:a17:907:97d0:b0:af9:2bb9:ea36 with SMTP id a640c23a62f3a-afcb9395356mr407563366b.7.1755197103114;
        Thu, 14 Aug 2025 11:45:03 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:02 -0700 (PDT)
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
Subject: [PATCH v1 2/5] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Thu, 14 Aug 2025 18:44:52 +0000
Message-ID: <20250814184455.723170-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..99f549263c37 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.51.0.rc0.215.g125493bb4a-goog

