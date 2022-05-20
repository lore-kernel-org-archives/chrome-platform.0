Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265127E
	for <chrome-platform@lists.linux.dev>; Fri, 20 May 2022 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=kwToCduxEHKRlf6xTfLStwKuhJjU+lyECx++Tp7rwBg=;
	b=dKidBF+iQ7d11gWNT/UoyXW+3Hs3JRy8MCTHjV+5ua+Tg8M5cogj66cbemiXXWJkpK0zsojA7lQyE
	 +WqVoFZWQ6MJXXhEGgSw5lyAml+bPL2Bob4FIJw5qswzhyuzPAS6nncjClEcmRp8/q5uuFnaXkNE2d
	 CPuaLrtvtWobbmHB9tsxsDLdpABvzpEFwrP2Hjj7G7q9P4zXpqd59UkkCfAXbqYiZX0JhO/0Al924K
	 wFSjZf6TdiexU83WgAFrBKHbEHcVNpQIMy29BaLvT2CXdB5WMu+1QWT1QpW5jqN1dCLHfvlGz7DBJM
	 XMgEyhF4mJWi5tS9mXMNT9APf2Wijnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=kwToCduxEHKRlf6xTfLStwKuhJjU+lyECx++Tp7rwBg=;
	b=n6agCsCBqaR8eTktbf5YnuH91+U1tOyO7hFP5kGyWriJEdb5PGp+30pFXfAEW1f4wny+jHMBg9N+G
	 uHm+DFOBg==
X-HalOne-Cookie: 6d6a2faa20e68cf1e8fd7d3b59daf8d1323c09c1
X-HalOne-ID: c1025af6-d851-11ec-a909-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id c1025af6-d851-11ec-a909-d0431ea8a290;
	Fri, 20 May 2022 15:30:19 +0000 (UTC)
Date: Fri, 20 May 2022 17:30:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Kalle Valo <kvalo@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Sebastian Reichel <sre@kernel.org>, Matt Mackall <mpm@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-pm@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-pci@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
Message-ID: <Yoe0CRhygXOIrYJc@ravnborg.org>
References: <20220519211411.2200720-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>

On Thu, May 19, 2022 at 04:14:11PM -0500, Rob Herring wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
> 
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org> # for everything in .../bindings/display/
