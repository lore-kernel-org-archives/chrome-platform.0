Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C6B366
	for <chrome-platform@lists.linux.dev>; Tue,  7 Mar 2023 05:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39ADFC433EF;
	Tue,  7 Mar 2023 05:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678167007;
	bh=k46Z8qil30UkPubY+jtx6YK2MddQ/Wd7FGeC+o8JD2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vix2NOLoK4n+AJ9GuMKjyl8xxKAe5beUPE0095965j5geGMFF3wrK8W2cKmWCx7R3
	 xmqWVjy8EcOiq/VVMGlFSML1Dt3Ey+rcmXaY6XkY09ZxGv8LLtcdMf2gHrBceCHnfO
	 P4N7fqz2XC7irbUO50XgRyiJgvAPsm00q006+yW3Y12XA7NOC9cbG2iayC4DAsH+wn
	 4gDu4LIoMjGiTM+D1hGPB7t6Kq7SgPTBoxXdfoZ+QvAvis9nMY4sxxlRhYLGVP6+TP
	 7RDRVu9pDo/5fWC8VSbCKY3e6uhjGCPxznwIZ3NlRAbaiNAp+IxNND+IJWSE8W0HHI
	 S9ujV2Fh3K4Pg==
Date: Tue, 7 Mar 2023 13:30:03 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, linux-rtc@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@pengutronix.de
Subject: Re: [PATCH 10/41] rtc: cros-ec: Convert to platform remove callback
 returning void
Message-ID: <ZAbL24vrpktpoLL2@google.com>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-11-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230304133028.2135435-11-u.kleine-koenig@pengutronix.de>

On Sat, Mar 04, 2023 at 02:29:57PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
