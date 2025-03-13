Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DDC1F3FE2
	for <chrome-platform@lists.linux.dev>; Thu, 13 Mar 2025 04:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741841287; cv=none; b=Xllrt2fJaKgIJItszPj+zf69XK7ceQaCAAZK7bSUMdWU6dSnEPtoFNX+7EOxlAPoodGyZO89k32S5+ALNehYVIeKvAfUdtZt+2sk4UndOgKbEcRf4DCxkP/fPOcbkZ/vHD7+OOqbXKUDE0PuMYJTRZCXfoa5Ym9KNvepawqdLTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741841287; c=relaxed/simple;
	bh=Y0Td/sWdH+knvqeBCTi/FRD4AvDH3lbDPwadbtlNZfE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RQB2bmYe7L16GgbyorUYzoPH5uc1Ax0PHs2qN8hJAn5NIumW77NJB0sbU8b9Le+k6GnXVrRfa2lt26K47sFsLnEfrpH34edOflZ2U0MKDxzivnfrORHxyfnwvaEmK7jkxeJ48V8aIB5bTnmeS2J/2EyTf1p8Al5GoEXorFppA9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JQNJSiw7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JQNJSiw7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22403cbb47fso10505755ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 21:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741841284; x=1742446084; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=REcOQ3NimKP7+/Ghwgmby8IZ78g2GtCKzkTqzXtjVyU=;
        b=JQNJSiw7sJQV7eKoomZ3DNU/LRtmta934oLU6L2bPr+9I1vSVqhCImEd+4jDv3Je8r
         BO8R74YchW7gP3rUGEx+9VyB0DFKDK8ktJPYa3k0HdltdUaag4v2Foy0FfO09Wt6UNou
         wfMnfgZqnBI5vTnDqOcX4HpoFQ0S44G3IXcRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741841284; x=1742446084;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REcOQ3NimKP7+/Ghwgmby8IZ78g2GtCKzkTqzXtjVyU=;
        b=vlLZfKyUjM8bErcNb7isWw9oBH8JbxXvN/n8X+fnfaYW1xAkc8KaeSxD6EfjUXNaeJ
         dV6m1ennFStaXOHHAC+lBW3EmO96tvB4l1Ndjo15WG9JuS4zaQs8Cy1EGcWTOQqD34+9
         IUPTA1irCCATqlKG4BydaWn/K3LUX+KaNUJzbQL4/en3AYRYvN9wsmWXu/h3RY577SFf
         cj4uDNNl0ySKrsKP9m3iU01yULNs3jEjR7h3+Wq/1240R8y7XAmFpH+KaiQ3MB2fMr9F
         C+mSpx4cN0V/OVnh7QgyUUv2SmbXb3QqXTMrJ7zTXLYxlpqyPFdkuygYD6ZzsT1/a7hM
         gwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc/QJJiJlL8Rp40KrpjSe0mhTiRWpVdjX/9pa1oO6cJxuHnCi3W/wE8zjRg5ynIYh0gYAgOODwcuQ3ptboTYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhQS81MQ4VQ1lvykapDQT3h+9qdFBYKJgX9LV9hD5QTf3ETkpo
	M1bGXUlJ1cxaMu8TnSX0ezsmfgvOgfqATUQU4yZ9AKWlE50pDYrRBIcQVqDue4g3Zz4cZirvJ2E
	=
X-Gm-Gg: ASbGnctA44E/y3s9SY386/9J99h+XaqlbUa1Y3eWEBrzGe67EM2cw+9xqPrdpI9T3Rh
	SggMSJR+q3gjYZ9q2lW0USRB7MEVjUG7T4DCvnCbh3gwOjJMVPzeRg6YIAhmYRrolTHjCv89+fQ
	VY3BZrIeszB8vCa/lR0F6Bz79TmW4MaXcuztgiFoFhnI05gjggtXlMWZXk5vi2MccTN4QNFKRX9
	BqUhwKymyYFP5+4EcVFk4lSNmavnUtIkebpEkwgRkounjyT0yM/4EouRhuUrOqb5jUT3m8Fck1q
	N5azq0vABM+avzoibm0Nldyl+1IAUov9YE+/n3TtzIrmIvw6SMBt2GrKo7wVfZeuNHs=
X-Google-Smtp-Source: AGHT+IFivHliX3YVhdxncqv12rrqQ3yO7uTaNUb3Gnhhii9egYkYfMhfwC4Ns2bXiI/Sc861z4Cx7g==
X-Received: by 2002:a17:902:ccc5:b0:223:f9a4:3f99 with SMTP id d9443c01a7336-22428a9d152mr344857145ad.29.1741841284353;
        Wed, 12 Mar 2025 21:48:04 -0700 (PDT)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:1872:6051:5c24:509e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5c03sm4188025ad.249.2025.03.12.21.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 21:48:04 -0700 (PDT)
From: Sung-Chi Li <lschyi@chromium.org>
Subject: [PATCH 0/3] Export the target RPM fan control by ChromeOS EC under
 hwmon
Date: Thu, 13 Mar 2025 12:47:41 +0800
Message-Id: <20250313-extend_ec_hwmon_fan-v1-0-5c566776f2c4@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1j0mcC/x3MQQqAIBBA0avErBNKcVFXiZDJxppFU2iUEN09a
 fkW/z+QKDIl6KsHIl2ceJeCtq7ArygLKZ6LQTfaNqY1ivJJMjvybr23XVxAUWiD7RAn7ScDpTw
 iBc7/dRjf9wNxGYvyZQAAAA==
X-Change-ID: 20250313-extend_ec_hwmon_fan-a5f59aab2cb3
To: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sung-Chi Li <lschyi@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741841282; l=847;
 i=lschyi@chromium.org; s=20241113; h=from:subject:message-id;
 bh=Y0Td/sWdH+knvqeBCTi/FRD4AvDH3lbDPwadbtlNZfE=;
 b=6crJeFwDT8h8Rk+m2OeKexaNtQbX5DfEuIIILaDCnFdUl2qZRkUR2HWQEJBeTDc0KSkaDvwpF
 lcKNjE6CRHeBxUNV3+8QlRLnzLCaFg1kXTyCaoIVGAoUQQaXP69v0Lf
X-Developer-Key: i=lschyi@chromium.org; a=ed25519;
 pk=nE3PJlqSK35GdWfB4oVLOwi4njfaUZRhM66HGos9P6o=

ChromeOS embedded controller (EC) supports closed-loop fan control. We
anticipate to have the fan related control from the kernel side, so this
series register the HWMON_F_TARGET attribute, and implement the read and
write function for setting/reading the target fan RPM from the EC side.

Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
---
Sung-Chi Li (3):
      hwmon: (cros_ec) Add setting target fan RPM function
      hwmon: (cros_ec) Add reading target fan RPM function
      hwmon: (cros_ec) Register fan target attribute

 drivers/hwmon/cros_ec_hwmon.c | 69 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 5 deletions(-)
---
base-commit: 9fbcd7b32bf7c0a5bda0f22c25df29d00a872017
change-id: 20250313-extend_ec_hwmon_fan-a5f59aab2cb3

Best regards,
-- 
Sung-Chi Li <lschyi@chromium.org>

