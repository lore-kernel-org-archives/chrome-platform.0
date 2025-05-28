Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAB61C54A2
	for <chrome-platform@lists.linux.dev>; Wed, 28 May 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432811; cv=none; b=NDvQ2N0A1ZKr97txhXNp7J75fiLe6qziV6c/T0aJVimU5cpP/U7OeqWa59+HTlBuNyJy5l21FEZqUiRsDd+kxCY9YL6UtJ0QH0Y1+FhwPNj34227yVOsqA8QstliLpHV/J9O0pCh7aMqrKYGt2LGcZBJCCBbG2ETBD4vpR/RDsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432811; c=relaxed/simple;
	bh=PDjgS5kxYJNN4P6hi3kNrFVLAcSYLUEUsuoFPTsbskk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=OgQJ7pVn4KTQpD0OHJ3O+brc55HyNzqX1wx8QB4GkEfzpqaeUgVUAATVYN77TF1WsONKSL/N/zjPLE2iDm/0XVdJ8oPhDlAr9I2UjasjWWoSivW5uah5ccg7hD9WlnzTf+OoPu9SL8PFvbra8mftTWHNx90i5P7rqDgVgHNCLeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tlvince.com; spf=pass smtp.mailfrom=tlvince.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tlvince.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tlvince.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36e090102so2461688f8f.2
        for <chrome-platform@lists.linux.dev>; Wed, 28 May 2025 04:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748432808; x=1749037608;
        h=mime-version:user-agent:content-transfer-encoding:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PDjgS5kxYJNN4P6hi3kNrFVLAcSYLUEUsuoFPTsbskk=;
        b=FdnrY5YSwIONw6Vzk2LBO/ITEZ4TDDPAMjuSCf7tI8SWkiQ5p4+kUmRpeGH00pjoLe
         QU+Vuwgz0UPyC3Hc3doK99QR2iL1y1obT7lTpzisvoJd1opg1uv7O1a9GHrZNbHUotHv
         tdOFzOotpPW1xJ7GVBaL6M+bVUuZCHLUp5ZkY24PxH4nWw+sj40YtQTKla8kpyn8KV/q
         d2DKsXtHMxJ0f0qbUe+9gfqG96vwI/rLsnNGzyxU/nn1b8AEUdSCFwwoK9yRJr5hLn+J
         0PA63jb4dZGmPLKy8JneIpTDC527fA/adzhtJbppNHsUmG9uqo5e6uf7SgU5BqGRSnUY
         m+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6M2kdZ0ixzAkaYk+Y8l6OI5fakEyDWaX6vV4lNaO14uaDaRAMPZ4V/LSyIgmKoW2/PatZFl/c5inBuEdUauo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4Hb3xOv0AurbaeioaxcqedjrsdHUlJSS1W/iysxI/oOzVWZGQ
	G1I/DgZCrVfXfnYUQkNS2wcKwgHrgX7QGIO8sBVAxdE4+7t4/CV+V/fD8S/RfyiPric=
X-Gm-Gg: ASbGncscTOqVzUUSuGgR3cmQS526yD7k2Mwlt34/9HpQ8TnCCvp1zAPOcZnE04URfBd
	00ilK30A5fe0pXoJxbrWPbTnpPirYcmzDL08RxB/w3jGh14Kosr2yEgdgxuk1mWQpH/OZ3jPT7L
	BynymTbXU3TrsiQLBK5EtmMhhrqWNpJhsUsKsLZAjEcoq9DoO2ftriofj2whjfaSAdUf5z49IqN
	rmI8k1jBurjFhnDiyeLHk4ag5qQ6DzLPdxNeBOgiYy4r8gPklDMwroPgunlYiDnVAjVNi/KmlhB
	sjLbbhpn6yH2/tVG/+1pufn3KEsABmRZWupIFEY40tVylKmKQowyb7Tz5+8LwAlLdyupfb9ugkn
	mp+S0KSC0ndfVbE/9f2xY3rwG1wps6OqMh1q8VQpj
X-Google-Smtp-Source: AGHT+IFNOKh+Aesaq3PzVr1eR8i8unVWVFffnvHc9V8h7XsbOFLDWZoiM6TIwWG3GEwz2XEKjOlv+g==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:df80:7284 with SMTP id ffacd0b85a97d-3a4e9437a5emr2061450f8f.1.1748432807768;
        Wed, 28 May 2025 04:46:47 -0700 (PDT)
Received: from framework.filo.uk (lewi-26-b2-v4wan-163478-cust494.vm4.cable.virginm.net. [86.21.73.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eac6e360sm1244603f8f.9.2025.05.28.04.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:46:47 -0700 (PDT)
Message-ID: <751abc6bdfda6bd3b99aacf2362bb4c590258f95.camel@tlvince.com>
Subject: Re: [PATCH] mfd: cros_ec: Separate charge-control probing from
 USB-PD
From: Tom Vincent <linux@tlvince.com>
To: linux@weissschuh.net
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
 groeck@chromium.org, 	lee@kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 28 May 2025 12:46:46 +0100
In-Reply-To: <20250521-cros-ec-mfd-chctl-probe-v1-1-6ebfe3a6efa7@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Thomas,

Applied this on top of v6.14.7 with a Framework AI 340, BIOS 3.03 and
cros_charge_control and the knobs now work as expected.

Tested-by: Tom Vincent <linux@tlvince.com>

Thanks,
Tom
