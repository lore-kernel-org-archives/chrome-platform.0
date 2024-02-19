Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94E52F68
	for <chrome-platform@lists.linux.dev>; Mon, 19 Feb 2024 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374211; cv=none; b=FJCH3IrVbmOdoHUO9Q0hdJIVVftwvBJxA33u0ziPEg/PZ1Hq0l4626ChAYRYTFjT/UMo004skd1+nkGrnlgYJ2VrlGvEIWREhMeJujUy6a5nz/FD66OysVMP1qCAZYxrlBEvL6+DJpgIUa/M50/6DOA2oIi/CmHn6FG+hE5MgsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374211; c=relaxed/simple;
	bh=l5a7ia9IlLLgaF40+x245tcDiaLXDStmBzlkO9wsMRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lb3aIwhhyErtZJRuHa6ggpaQAKgoz5N22RP7hHfRx1BmnNwzdKna96PEgMhAyx/3W8swmf+gunVawWzEmbfTBbhrTxFqqzHaWlJS5BfXduZanxXZmrFoZinomh1iFZJspJIiEYFDHvyiLDFqw5qJtklhbNmxT32Gd54Vaj5Ley4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ieTL/+zL; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ieTL/+zL"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1db51e55023so25477205ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 19 Feb 2024 12:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708374209; x=1708979009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=secGjYcmf+kGbl9y3oNWHWyDsYIjbQerI2pVhqZBL+Y=;
        b=ieTL/+zLEKJZwxdmoYC+Nz0cooYwASfhTVLxTSQSKu3H5enJKZEyUfHI3twh/G7U+F
         yA25emUcvc4a6EVIg1mIQAExEvdnk/7k6xya8h/zhfbrcu674hEVuUX6JxJumxsmP4SM
         VWCgwth6ClJmoLc1ZwkLWuH5qYaVfH37bTERM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708374209; x=1708979009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=secGjYcmf+kGbl9y3oNWHWyDsYIjbQerI2pVhqZBL+Y=;
        b=WHDe/JY++n+86NnA/9MldYrFTbkcxej8ERdGbzR9bYFdn3LXAJqwZXM8ExV83ihX5w
         FTSql767mh+HYdmkqWbebKuC7jhnoA47K/cs5GCg2Izj1NgFvSULiC0NP1eAlMzs1pq3
         qyJmT6yDfClMvWErZjrqns1JvPep0XXNFkRtxKzX3EDfruS6ZavCVk5QgXlEdeIOFkAA
         +c6Ccz5VbU8hN89NforD0GV1gOySaitYP+J/DEPcBlFDAff5owzJtZ/PokEiGEI5QjHW
         Ez5cSUHzhx92l5fbGa26fTfYIZoAjLKSjEKk649IY0mOc81KCB1lGEBc88Uv1qvhluPQ
         O+AA==
X-Forwarded-Encrypted: i=1; AJvYcCU6NUViAborkKeSMq9wz23KoxrIWNBOyXPX3Qdy47/M5AZ6VQTcA2em70oMBmE5V+z4CjjP59ItFtZZNM3IiBdE3zLtgL+TfsY8gZOMqZGJ
X-Gm-Message-State: AOJu0Yz1KhP154LgMvcjbOW7lZwjyRjqD2O70xQscEjV28b/wTLZLuS5
	qZVWW07hVc0TOJif4LUSA1kufyKep8OKCiglHTMQHe+LN3omETsXT+qQvY+3fg==
X-Google-Smtp-Source: AGHT+IEOuEc8BZ3sbq0Aa1nPkexoG1gStEF1O3PcZO88wMSU3rcw8RjvnUna2Xk+VmRtqkQ8RN/+Gw==
X-Received: by 2002:a17:903:98c:b0:1db:be91:c5f8 with SMTP id mb12-20020a170903098c00b001dbbe91c5f8mr9235117plb.29.1708374208967;
        Mon, 19 Feb 2024 12:23:28 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id lc11-20020a170902fa8b00b001d8a93fa5b1sm4803195plb.131.2024.02.19.12.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 12:23:28 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] mfd: cros_ec_dev: Add gpio device and DT binding
Date: Mon, 19 Feb 2024 12:23:22 -0800
Message-ID: <20240219202325.4095816-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is the mfd part of a larger series[1] that describes the USB
topology on ARM based chromebooks. These two patches add the gpio device
and DT bindings when the GPIO feature is present. The gpio driver will
be sent separately.

Stephen Boyd (2):
  dt-bindings: cros-ec: Add properties for GPIO controller
  mfd: cros_ec_dev: Add gpio device if feature present on EC

 .../devicetree/bindings/mfd/google,cros-ec.yaml          | 7 +++++++
 drivers/mfd/cros_ec_dev.c                                | 9 +++++++++
 2 files changed, 16 insertions(+)

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Benson Leung <bleung@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>

[1] https://lore.kernel.org/r/20240210070934.2549994-1-swboyd@chromium.org

base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
-- 
https://chromeos.dev

