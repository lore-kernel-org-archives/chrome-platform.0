Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C4F7A
	for <chrome-platform@lists.linux.dev>; Fri,  8 Jul 2022 09:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE064C341C0;
	Fri,  8 Jul 2022 09:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1657272090;
	bh=sR+zrj6Jh8+CXHksvH2t6G7kDXoYwnJpKv6ougosx2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGFILMUSORUl9kCT1Zvri5+FUzKG2n8iczH3pm1IrFetQob+s1yDs2013+UaiFqGF
	 4e1Z4u43YTbLWPtoFJzmnbB/jZXXyQlCOA11zpT//sOGkp4qJ2WjDbPghN1twgKPXH
	 vnwzf/ShnFSN+p7VCB82LTpjRfpO1s3VIrYalw20=
Date: Fri, 8 Jul 2022 11:21:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v3 2/9] usb: typec: Add retimer handle to port
Message-ID: <Ysf3F3VvmoqCFj4P@kroah.com>
References: <20220707222045.1415417-1-pmalani@chromium.org>
 <20220707222045.1415417-3-pmalani@chromium.org>
 <509bf6fe-4406-c577-aa70-6eb70801e375@omp.ru>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509bf6fe-4406-c577-aa70-6eb70801e375@omp.ru>

On Fri, Jul 08, 2022 at 11:46:44AM +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 7/8/22 1:20 AM, Prashant Malani wrote:
> 
> > Similar to mux and orientation switch, add a handle for registered
> > retimer to the port, so that it has handles to the various switches
> > connected to it.
> > 
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> > 
> > Changes since v2:
> > - No changes.
> > 
> > Changes since v1:
> > - Relinquish retimer reference during typec_release.
> > 
> >  drivers/usb/typec/class.c | 9 +++++++++
> >  drivers/usb/typec/class.h | 1 +
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 9062836bb638..f08e32d552b4 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> [...]
> > @@ -2249,6 +2251,13 @@ struct typec_port *typec_register_port(struct device *parent,
> >  		return ERR_PTR(ret);
> >  	}
> >  
> > +	port->retimer = typec_retimer_get(&port->dev);
> > +	if (IS_ERR(port->retimer)) {
> > +		ret = PTR_ERR(port->retimer);
> > +		put_device(&port->dev);
> > +		return ERR_PTR(ret);
> 
>    Why convert it to and fro, and not just return port->retimer?

That would be a use-after-free as port might now be gone.

thanks,

greg k-h
