Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D2243946
	for <chrome-platform@lists.linux.dev>; Mon,  4 Aug 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298266; cv=none; b=JMVVj8p/Qr1qnZ3WqH/Sa3NbsBu/6WsLUC0NM9L45W5lfSytOoNCxQj1BWgkTlwO0sZJ9C1t9k29vVUhGytba52mEe22OPvPfdALIVB0NN1/kI4xNNUAUBbihSOzRV/pAtFMYZuiheZHnp8ZjTi3LEXKjiO2FjzY/1NYPPPkxkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298266; c=relaxed/simple;
	bh=ud242vZvLJrH6xopdOSJSplgPyMO56QkORuiEVdjqaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k3lLIeNoCaWBO5y0SRb6VQ6lI3AHkzkyqAWwBosTyDj7sfGwupQwByk2mcx0HGx+SVZhXgolErBC8sfQZonMo2pfbJorsme/Qq6X7y1l/FCiC3kha0EU1edQSUwCxY3G9xrCTfnySZ3PgrfhEg5WrrCatqkUJvfqv1onRCXrgMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nl2zC+Cg; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nl2zC+Cg"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so4974692a12.1
        for <chrome-platform@lists.linux.dev>; Mon, 04 Aug 2025 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298263; x=1754903063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHnJVEZKYStNja74J0DOKbp6uiLWBK5/zflpDmAO16o=;
        b=nl2zC+CgpS0EY/EUWEaptCpIML4CYx0Bpim/JXpXkIDHiBW2DDotCW0wZa+6Q/Z+01
         snIPA3H2UJ1gkBAH9GLWpdrU2Wb2BPCxdpl/KP6mAYA4C+GLcXKuEIunnjfbFMNMZ3a0
         qzWLVkIDuEsfsLjpWr2eRj+5IbBLR28Sqx2C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298263; x=1754903063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tHnJVEZKYStNja74J0DOKbp6uiLWBK5/zflpDmAO16o=;
        b=LRaniNQz1YG35gAuuumnmFsz/XfmTrwtyLw0ADs/Tc2SqCc0IwTUInkYgVec+K8s6+
         Jb2/hrdHUWoDwvLp7TOM+SE/oIdDQ2L+1KfoHQCdhV1+Sir5q3TxKwA3NApZshZ3JF44
         UlBrw9YaEkzCIDBveAbPzoou1iWP0hjqr7W/B2kv9qOo67kW7u5IwWX+8itbVQXIjZPB
         NNdwY5ANg9hfXHOeWB37NCS1bSMvnKW4xxTU3XFofZGqW1BxaOutVFAKVVxef8EaTKqC
         w2Gkx/PbNy1bLQK9bwjfwHS1XbOvqievF1JbKcHToQ9swOQ+4tZNQQp+ExPpo4qK9E8P
         0f1w==
X-Forwarded-Encrypted: i=1; AJvYcCV36C7vqs3DQlCmsJey2MtdEBCzeOJfmBiJywdu9hKCZQUJyPY/Awf249s5Gq60OOxtVLR0lGK3YWlMXtuVrqo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe7xh531RoJb2KV5EaQq6+4WbQmY9Sox9Zy2PSZ+bxkWMY3E1A
	rQYMkvqBajUzAAOxM1ZWf9U5M//39Z3pBKy48XhEeVhTl+RzxG0Q16qv5oxI9t9uTA==
X-Gm-Gg: ASbGncuP7xvZNaF1Ys1sHX9EcL5af8gd2cQ+cdDQhx+GfDWlvJ8CUOebHOWOHC2uf3A
	0WNEQfyy5FhLxJeQntAAsTwM2rqriXZxFbbLK6qiFxvym4xGTuoxgLymT2eKlgfB5ErdwzsE/cz
	n8KnYEu6h0ojvUOJ51B4CS5C4GU2T6qskvK1AMKWipfM+3lc+yvgVdkwvpRSI2QmJPR6J9RNl6a
	yGhuy+uGcXxOXeKftgZLpDCm7gpeQNfK3ULyvLRT8sEFtrszuVpmt3S8TvWM7pcIP1XYWtj729Q
	hdtGWErShPl/m5pCIpQIG8isBQ+SbRv9d4pueUJIFKORzThVkqoUqEf7ohJ18V3BqfR1z0KnHiE
	QlevlLtBTqNLdbK0YO1N9CXtufwzQQiFehk3pagvFabvVP3LwuWcTY1ZF73ZVSfEgu8UJ220MmH
	gUBb4wnlLqUM7V6XAYNLKASpW/iA==
X-Google-Smtp-Source: AGHT+IGlP1mTwXR2PA9n8SopXtLR0QRbnOxjHuzCPP04R6m/RhGzUKKa90WwYf+waVhclx/pDtB5+A==
X-Received: by 2002:a05:6402:90c:b0:615:6fae:d766 with SMTP id 4fb4d7f45d1cf-615e73889a3mr7449193a12.26.1754298263208;
        Mon, 04 Aug 2025 02:04:23 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:22 -0700 (PDT)
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
Subject: [PATCH v3 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon,  4 Aug 2025 09:03:31 +0000
Message-ID: <20250804090340.3062182-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
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
2.50.1.565.gc32cd1483b-goog

