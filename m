Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888191C32
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 05:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78413C433D6;
	Tue, 16 Aug 2022 05:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660626711;
	bh=3lsNv/BfSOvovoY2sQwhKkg8Ton42wqCJargMfbwk1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MboDQ3OZGkkLy7gvPjXhQnhjsYGCQKAlOAu2QE07wB74+FMJPuG6IYjQSObQxx55V
	 7PKciKtxKlbp2CGKHKq1wxzPsoJsP4P0nM8Tp7hNjWn3YvAS1FHznQLPFIZYexmEsu
	 EG4Os48X+N3Iobbj64FOo4XVI5q1ed/eLz6B49jC2az/k1u2Lc3ArLgDHvjbjxrW20
	 SgWa7It1oygfmaMwLSihki3NpAjG4v1rxYkDgot6oK49olRoP8INZqPPFPogJuOvxo
	 fT/NTE3rW9WlJEoH0tik9ALd2acgW6D7nRYyEkzwuwEr/hPQpNimR8Z2GQGbmbxVp2
	 GCWrdtx1WKMUQ==
Date: Tue, 16 Aug 2022 05:11:47 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH v5 4/7] platform/chrome: cros_typec_switch: Add event
 check
Message-ID: <YvsnE55zGVGxGpPv@google.com>
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-5-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815063555.1384505-5-pmalani@chromium.org>

On Mon, Aug 15, 2022 at 06:34:24AM +0000, Prashant Malani wrote:
> The Chrome EC updates Type-C status events when mux set requests from

To be consistent to the series, I guess you would like to use ChromeOS
instead of Chrome?

> +static int cros_typec_send_clear_event(struct cros_typec_switch_data *sdata, int port_num,
> +				       u32 events_mask)
> +{
[...]
> +	return cros_ec_cmd(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
> +			   sizeof(req), NULL, 0);

The line can join to the previous line without exceeding col-100.
