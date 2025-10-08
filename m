Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640612D060C
	for <chrome-platform@lists.linux.dev>; Wed,  8 Oct 2025 23:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759966510; cv=none; b=W9iR6Hzah/FpnSilHi78cdv/s8c6LHp/AhqHJd6FpgqByD+zdcldBT4U1VroVfNuOkZUDMzo05KFY55os/lS158Wkxn2Je2Zh658QBGspcIgsnEt6nvdkNybeddTqYTiK77RImuztvtc2gvLoQiwuoZ+0X7OWoIGUOcUhpyK4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759966510; c=relaxed/simple;
	bh=9igNQRi1zsIULgFOJ+Hpha80v02kSWzsiG8eRfeHWOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWibqGkRgTsO57+Zremnz6uJuV5L8gqXoCLuIzi7g48AkNmciNRy5bf2W/lGXU2xTc/lxfpQoPV5awiSF/dFCrn6AkusHAyxnr7INOBXwybp79Y5cKT8oOE4n0biYhvoJpex4I4HPonPFrvczSZdoahlH+w+CGfHJXahRkeFDcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mmftWnZR; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mmftWnZR"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so340265f8f.3
        for <chrome-platform@lists.linux.dev>; Wed, 08 Oct 2025 16:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759966507; x=1760571307; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9igNQRi1zsIULgFOJ+Hpha80v02kSWzsiG8eRfeHWOg=;
        b=mmftWnZRmS0vMvSnnJ/SwV1j67zaQu+ysrWnPGUN3o+r41Gj+PYeQjSi5M1zFCQM2r
         rnKWAQn7xfRW23igULNNdOjZQE2axpuaZKcAX0u1cxfS+XVSpPxUD2kqa52jnsrXzet8
         2bHlZUp4QiE/YZFyzVCj9k98E4dJDCMZn1tY3nCb07x3K1++B0VN1L73Fkp+X81qbQij
         UxjlBoHBq6oYS19BgQvRmNC8gCbjSYQt0hX8Xfi+NcmJDiH0tydkictDLoxFCeiEiP4M
         o2EWjTyvytqxpFb4fPogdB7kt4SPB5uVs+zYqEKz8roN5ILDk2aXcXCgJiJJ42GI1PzW
         m93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759966507; x=1760571307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9igNQRi1zsIULgFOJ+Hpha80v02kSWzsiG8eRfeHWOg=;
        b=Vb3HrHM3oO8WtCYoDTW5FJjj6LVaIkOtYQq78Shr5NU6hvfwvkGx0RSmPtiEgiioGU
         RGKhE0LosPpp1sJhh2TKf5HwzE6N1msNzKuuIKOXQI0XmN+Wa1ee2HYzJcDi+0d5hqL/
         ddj9xHQUnMg2nxp0/tg5vLOceVVtRdTWIuKXA6dyLDS/UosKxNgrjDa1IgNarRnGAwuI
         L9JTLXAUVWbOzuzKNwL3JbHM7Q4LgUHDNk3NjlSZdcEG4BAR2v2MUxDbQYQrJP1yobJ9
         506Hd3yeKj0tKRpT6/f/mpkbBBYJ9uH1FGvpsJ7aDUmUSPNsvlnkm2p11jyyoIsXyBvG
         a8wA==
X-Forwarded-Encrypted: i=1; AJvYcCXofl+X7CEWMb0Siifvsu1RrIB5PKdrNAxXKmANkZboUyopbM4zk5sjRN7R/F8gQxaOVzs6Wa1br4eoA69TxxQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsQP5aQvOLi9XxKwaAsuQ/7zNtVMJtbUIA9npPlaweCK1wwhOW
	z1iqCfXvnPC2ODoVhe8Uoqs9jR3rCuyemlPAh6qoEu6fMAoq5HDEksbIZrYypXXNDLN2EuQeyWe
	SBGU6Eq/+iysLc5aG6X3M/r+EHQZeFQw7VbbGYJB4
X-Gm-Gg: ASbGncvakxppFu07HFCE1D/+b/rz36QL3XpKZAP4LwbTLSrs4Nu0ughGg/hOlkgY/+L
	VQQTgwcW7MFk+/NhWEMC7MOD3GNXWNur7PtlRsLAWXA//6x2AUXeDGDwLo1NNSIBUQHybmi5XTk
	gIaP/Xps5lrMsKeQLLNap1HFA2AKW/9v7kgGXez0z6mKbjgZjiptHn5pE4rbSK+vt8ojcIfO+Oc
	xFUar56B440nMBo8Y7XaxZVtAaTqe5jKku/ASco+Ty67lKEtl9Rn/dSJIy+FA+Wve0lEpeBMbpN
	9g2ixhecdLtTlA==
X-Google-Smtp-Source: AGHT+IEqmdZ9VxhWMpDcRldSURNd0QiDBJUs0+1kYdV5l/JzukTnaa5H9DzGsLurz4/S6KkfONlhR48b+fTHniX4RxU=
X-Received: by 2002:a05:6000:4313:b0:3ea:6680:8fb5 with SMTP id
 ffacd0b85a97d-42666ab29d5mr2881250f8f.2.1759966506486; Wed, 08 Oct 2025
 16:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com> <20251001193346.1724998-4-jthies@google.com>
 <aOZUq6K8bZtciL6Q@kuha.fi.intel.com>
In-Reply-To: <aOZUq6K8bZtciL6Q@kuha.fi.intel.com>
From: Jameson Thies <jthies@google.com>
Date: Wed, 8 Oct 2025 16:34:54 -0700
X-Gm-Features: AS18NWDl9Wn1v62FRwVNd2rJ20xgecQEZIHrqIoqrT8lQI_Q_BqxHXid5fR55og
Message-ID: <CAMFSARfn_ULu2+JXjGSjz4KPDOSD=MAcKS8XwZNqbHf7YL6JBg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, ukaszb@chromium.org, tzungbi@kernel.org, 
	devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If you are not using that for anything, then couldn't you just use
> acpi_dev_found("GOOG0021") ?

Thanks, this is a good suggestion. I'll switch to acpi_dev_found() in
the v3 update.

> Can there be multiple UCSI interfaces on these systems?

None of our devices will support multiple UCSI interfaces.
