Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7202D1BC097
	for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388444; cv=none; b=cMzyULa0ZCYUeq8EkT14MRJBaDNWg04r2zEkPgF95hsVQRRT/+Q8YzAgjiRObJ+6qCnSy20SrkKstaXbRDy3DWsxtRihTv/LmbwibLjPfVLXoH1StigtcXGof9WYEnaszzzUew8R4j8w27KGrl8LJqeriXZP+yoCFWgHrIDpwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388444; c=relaxed/simple;
	bh=s19xiscdrxWoyhnH6+9SM+7lYdKPqidKN1eD+lS5570=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CN7tf/wMz5jre5Gaa9BGTp7+TOnUdA/0J1Ngw1fkE8xMNgM+Vh45KaRCraOO2PSrBv08iGduzz9KNS7BGAIv8UrED/mELy0eoAAbF7goHHh/xFxyulEY+v97f8QNCGiVyg2VJgngDH34zs++TVXXvZalFoO+0QU3LU+PgTbTk/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iVQjl+EE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iVQjl+EE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43169902057so8739315e9.0
        for <chrome-platform@lists.linux.dev>; Thu, 31 Oct 2024 08:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730388440; x=1730993240; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CuKYisz+WfuMrY46Ard53ju2b4imnRFwr+IipE+GsB0=;
        b=iVQjl+EEfJUFtoQ5JvPV0hXbJgeG1sh7qcXxOsP9Yqqw6GEG6i9wgyKsf4u58iVCIa
         2mXa89nKj6jauU5ZgpUWj6hJq8UO3vBuvvXvCVSsWzuuvSWltH6exSohSZlpmW0ChNSS
         PztFtryg4EBFEeOdsZWjRcn73CSXlZTEDtF4wjWpLXha6asTarD2yCJxLJYPLNzwLCCU
         oiu8K6y7F0I9KFj5LJed/jLSsCEmkGkrgGdiPCuI9VdhkxUAHfjOeElQmMIUu4p5h49A
         pkNt7dtQfTN09PhFC/c4TByPlV6hHqmX9qrJEuzMyQRhFURwHEBDxckRXSZnOvOmGQZs
         5oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730388440; x=1730993240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CuKYisz+WfuMrY46Ard53ju2b4imnRFwr+IipE+GsB0=;
        b=WgudD1Xay/yMM7W/LNUOIIAYayPRlh8KLTWCaAZnu+D41D9v8ltuIl1K91Eb9G3VAg
         EpyWA3RghCvVSYIAPosLfGS/VTG6wRTsG/E/qH5mCB2BBw5og6LkWTqLiEp9DL71nj3G
         flU4FEqKqf9+3cO1Z6aHFsiKroa6Mhih0BR9uAF4ggNHLRkGm2UllaZgE8ht4g9G+95t
         vd99eVFUP4RWfcD+4rbO1mfjm5KvaLBKt1OiDkZu+Oypp4RZHrJ6PAMecqimowGPjxKO
         kzPYwlvte2adhNTinlvHcYvP9OjujWFI3ckTA73CJRL8qpVWmTfyZmImVBXMq5s0FWiX
         K/bw==
X-Forwarded-Encrypted: i=1; AJvYcCUA309d+47XCOFA9CVSoXwKRBQk8Ivu6B7XK87uJfjyY8A+y0hCzVlDaV6fdjHR47JwCg1OSJPfIQFsTMe5c+k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaoR0zRl0BVg8cnTBlOE8BCrOIW6oI1BOMae/ra0iqmxGRNJFZ
	G+mwzd+jUsOBhHHvzSergZv0aH0WUoAWoJ2Pdpfaeu60KP/Oy0YtNdPRZuue7eI=
X-Google-Smtp-Source: AGHT+IF6/i3o0ia+iwTXrJkK/PpU7s5AqPYFhPt+pBzmwQ1VaBg1134R2wQ1oOCceXnLNgNRe+dsWA==
X-Received: by 2002:a05:600c:a04:b0:42c:b80e:5e50 with SMTP id 5b1f17b1804b1-431bb8a01dfmr64636815e9.0.1730388439775;
        Thu, 31 Oct 2024 08:27:19 -0700 (PDT)
Received: from [192.168.1.64] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm29399475e9.12.2024.10.31.08.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:27:19 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 31 Oct 2024 16:27:07 +0100
Subject: [PATCH v2 12/15] iio: light: apds9300: use bool for event state
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-iio-fix-write-event-config-signature-v2-12-2bcacbb517a2@baylibre.com>
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
In-Reply-To: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
To: Mudit Sharma <muditsharma.info@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Anshul Dalal <anshulusr@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Ramona Gradinariu <ramona.gradinariu@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Dan Robertson <dan@dlrobertson.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Mariel Tinaco <Mariel.Tinaco@analog.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Since the write_event_config callback now uses a bool for the state
parameter, update apds9300_set_intr_state accordingly and change intr_en
to bool.

Also update apds9300_set_power_state and power_state for consistency.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/light/apds9300.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/light/apds9300.c b/drivers/iio/light/apds9300.c
index 95861b2a5b2d94011d894959289c5c4f06cc1efe..98bdf8bc298b664aba71d3c38d7f224808e5997d 100644
--- a/drivers/iio/light/apds9300.c
+++ b/drivers/iio/light/apds9300.c
@@ -46,10 +46,10 @@
 struct apds9300_data {
 	struct i2c_client *client;
 	struct mutex mutex;
-	int power_state;
+	bool power_state;
 	int thresh_low;
 	int thresh_hi;
-	int intr_en;
+	bool intr_en;
 };
 
 /* Lux calculation */
@@ -148,7 +148,7 @@ static int apds9300_set_thresh_hi(struct apds9300_data *data, int value)
 	return 0;
 }
 
-static int apds9300_set_intr_state(struct apds9300_data *data, int state)
+static int apds9300_set_intr_state(struct apds9300_data *data, bool state)
 {
 	int ret;
 	u8 cmd;
@@ -169,7 +169,7 @@ static int apds9300_set_intr_state(struct apds9300_data *data, int state)
 	return 0;
 }
 
-static int apds9300_set_power_state(struct apds9300_data *data, int state)
+static int apds9300_set_power_state(struct apds9300_data *data, bool state)
 {
 	int ret;
 	u8 cmd;

-- 
2.47.0

