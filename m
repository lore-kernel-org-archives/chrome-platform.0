Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6784EB5C
	for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 07:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525529; cv=none; b=Omkb01qcHgzFwLSBrrr9DXZ5FO+amWLqXx/1RvuQtrrqMYc7unq7UJyNlcNHmTRZDVyAvBHcMmCC1WDfR167s+qsO6MZ9R/TOTzDMKLWZObga1/7T0mTTs2VCTrDFngRKsPHlXYV63J8+0AW3CVIXVtMpLIyZWGl0oOlawXF83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525529; c=relaxed/simple;
	bh=fNSLfPDJxvqzAJQHrbVhzvU7cCoozexEWJo8bYlcjeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pmQOFwT84eqFZgd6kz8wE/Ik07ZYI7KMv+7TyZyWvXWuGDkR89hT2JWOX0khc1Ho9EH3YE02e/ZrMKHvukblsi3WNnN9x+nVD5vgugEliI3OMXV/3Wocx6f8oBGBj8J4tR+LNS2BqzgjeW/lU5UYNb+L4WFKdfdOGfvPwpNE7/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbpBDrf7; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbpBDrf7"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4e0b2d5b3aso6646966b.2
        for <chrome-platform@lists.linux.dev>; Wed, 27 Mar 2024 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525525; x=1712130325; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vv564JitDc+m3bwVY53Vc2L9rcayUx+g3EXkDyYeLek=;
        b=AbpBDrf7G+QBWhqVj9rL/oIIASw64S5ibLUdBJpja7UXfdy+cKiNntng5k7wzKYWRt
         5ee0fv0VssHttotelbjnWtqTSE+D87VUCMSFQinF3yEb79jKaWtPs8fW6EnrQ6UrlpO1
         CgEPtensQI0A1yggptnwSJC+KAcCJQwdEZFukojeMXG0pvel3twYRumEAe2+n0wbkB4u
         hy8Vbhkd8fkYlE4a5hFSXEbps5iALsBA65+zEmHJGJCwU7kGFxoyZIoIADKY0acAutVO
         oZfDAhPdbaz7O8CKr9pY2f5QZcpVyzK74cG3rhxlayKTrKt543cx6DB5cuukWYJJJQ+x
         Tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525525; x=1712130325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vv564JitDc+m3bwVY53Vc2L9rcayUx+g3EXkDyYeLek=;
        b=QpHhb/GtislSQKVulMd5fOzv8LQIbbeL7SdbSv7L8oLDn0GeBwU6jZJnuZBJAguIUA
         Ow3EofQ4G+AANu1NbTDM2rovfMi8aQKQsDohuaTHMhHS0b7gke3Z8H1hsBHZvNMJWtHD
         0JIRFdd97VjXzvklbK6Tq+ge8/hxQFzWqsz+C3DYawXRqZJzMMhUit4ppo+RP5U9+CHg
         N0UL/zsiRKeXezU1SnakbNK3pSoX3ujIXWp5kiPfrGLKy1m+uoCWZtvx6PefwHTGmcYp
         bwAY54B/MbKOPT4luX+7/JUPLUT1ayN7g7XNMsX4XxpK8+9fx+ejZBB8hpuEHczC8WUF
         I+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUm8NYu1PEwSgtK5jSsbjqKQ+bLt7S09NhBiedD03Bh0HWmkV/Zc8bIvI91xsX2FgCnt9x/UFZYJUpWVL60tELlpLq8HPQ7saxbL2ZmNlOF
X-Gm-Message-State: AOJu0Yz0EjNlnz+znis1p7IEOIcJixJITI0+2MGrHpm4kLfeyCpZMPTP
	4ULUIFkRi4T7gLp2wgwZPPxU73QKbN6rz528lpNDiF685zr4/sxfNfw5EjbjqAY=
X-Google-Smtp-Source: AGHT+IGsYWPKpHC4XVfxYs0S1B5uDe0mNzlz9NNZ3aJWZfPENKcVMpeznfBuVBr0YCZ09qhBbW7UTw==
X-Received: by 2002:a17:906:a18d:b0:a4a:3b20:87e9 with SMTP id s13-20020a170906a18d00b00a4a3b2087e9mr272492ejy.41.1711525525004;
        Wed, 27 Mar 2024 00:45:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:58 +0100
Subject: [PATCH 11/19] platform/x86/lg-laptop: drop owner assignment
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-11-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=630;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fNSLfPDJxvqzAJQHrbVhzvU7cCoozexEWJo8bYlcjeQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85UAd3MCxLaH71C3PUTAKtVVS3LD9ZEi+Bd4
 zSjNVNu0DOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOVAAKCRDBN2bmhouD
 1ySED/9q+c5LahbfTxRZfj5CLqGz5NQDTHVVT3t/8W3nBwVR4c3lsdoVunHZl71EdPYHE4VFF21
 auFpplM1n5StC4sokoRL4st33AA4FeuHkvBtYM4kU1CdCHsg9S9oEuLPY194KZiqUIV20fIfsS9
 lGU62GuBgdTd4oItrcF+h90dZaxx8Eu5CeEXr0t71OgZnOq4D26VGIB/2OAV7DfMCY/t5Kmvprz
 8nRRvwfWqyHL0kn8hQIhtcS+pVMO5KTl/he8YLqFRZ9MhKC6hAYS4Ft8vGbGIeJn6M61p20YSm6
 lw4KoQJ16GlchnLTjw2sa2A2tU/PQPUbodhteAmWMIN0NrGow0PmPK0O17paStaiIPeL0OrL+Iq
 kH0enrLV0UeMSBjSNWCoQMYhrxjXQf7VDLo3gmcA9e4SXMvYFu86kE9aBscXOwG4DussxQDmcer
 OUe936UdjLPfXx4C80cLi8Tq3mxpWJROSMULkah1E+Hk3cV/QAawsMOMjl6AefrmPa5K6EZrvbX
 etfCRbMyL+JMxIKA+XXVCzPzYbTTzQQETTYfGgQ8/qlDXqF7NT9UzpdC1ZZQ562xQ8Aaau2T17I
 4HZzgbFVAhJOi9y9M8ND1kaUxoM0OK/axI+Bxu4Zs2aOF/LDdMe+0K6bsBMnskdc5FeXC+U+HnH
 QkXB6QwsobOD3Ag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/lg-laptop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index ad3c39e9e9f5..36e88b9d59ea 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -790,7 +790,6 @@ static struct acpi_driver acpi_driver = {
 		.remove = acpi_remove,
 		.notify = acpi_notify,
 		},
-	.owner = THIS_MODULE,
 };
 
 static int __init acpi_init(void)

-- 
2.34.1

